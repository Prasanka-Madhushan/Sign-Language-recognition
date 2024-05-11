import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? _outputs;
  File? _image;
  bool _loading = false;

  final FlutterTts flutterTts = FlutterTts();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

//Tflite model
  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  Future<void> speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

//Camera UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ASL Recognition'),
        centerTitle: true,
        leading: Navigator.of(context).canPop()
            ? IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop())
            : null,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            _loading ? CircularProgressIndicator() : Container(),
            _image != null
                ? Image.file(_image!,
                    height: 300, width: double.infinity, fit: BoxFit.cover)
                : Text('No image selected.'),
            SizedBox(height: 20),
            _outputs != null
                ? Text("${_outputs![0]["label"]}",
                    style: TextStyle(fontSize: 20))
                : Container(),
            SizedBox(height: 20),
            _outputs != null
                ? ElevatedButton.icon(
                    onPressed: () => speak("${_outputs![0]["label"]}"),
                    icon: Icon(Icons.play_arrow),
                    label: Text("Speak"))
                : Container(),
          ],
        ),
      ),
      floatingActionButton: showFloatingActionButton(),
    );
  }

  Widget showFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: _image == null ? Colors.green : Colors.red,
      child: Icon(_image == null ? Icons.add_a_photo : Icons.delete),
      tooltip: 'Pick Image',
      onPressed: _image == null ? _optionsDialogBox : _resetImage,
    );
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextButton(
                    child: Text('Take a Picture'), onPressed: openCamera),
                TextButton(
                    child: Text('Choose from Gallery'), onPressed: openGallery),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> openCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    Navigator.of(context).pop();
    _setImage(pickedFile);
  }

  Future<void> openGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    Navigator.of(context).pop();
    _setImage(pickedFile);
  }

  void _setImage(XFile? pickedFile) {
    if (pickedFile != null) {
      setState(() {
        _loading = true;
        _image = File(pickedFile.path);
      });
      classifyImage(_image!);
    }
  }

  void classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  void _resetImage() {
    setState(() {
      _image = null;
      _outputs = null;
    });
  }
}
