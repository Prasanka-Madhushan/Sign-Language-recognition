import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:tflite/tflite.dart';
import 'package:tflite_v2/tflite_v2.dart';

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

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      'Take a Picture',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: openCamera,
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    child: Text(
                      'Choose from Gallery',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> openCamera() async {
  final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
  Navigator.of(context).pop();
  if (pickedFile != null) {
    setState(() {
      _loading = true;
      _image = File(pickedFile.path);
    });
    classifyImage(_image!);
  }
}

Future<void> openGallery() async {
  final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  Navigator.of(context).pop();
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

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('ASL Recognition'))),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 170),
            if (_loading)
              Center(
                child: CircularProgressIndicator(),
              )
            else
              Center(
                child: _image == null
                    ? Text('No image selected.')
                    : Column(
                        children: [
                          Image.file(_image!, height: 400, width: 400),
                          SizedBox(height: 20),
                          if (_outputs != null)
                            Text(
                              "${_outputs![0]["label"]}",
                              style: TextStyle(fontSize: 20),
                            ),
                        ],
                      ),
              ),
            SizedBox(height: 10),
            if (_outputs != null)
              Center(
                child: FlatButton(
                  onPressed: () {
                    speak("${_outputs![0]["label"]}");
                  },
                  child: Icon(Icons.play_arrow, size: 60, color: Colors.blue),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: showFloatingActionButton(),
    );
  }

  Widget showFloatingActionButton() {
    if (_image == null) {
      return FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add_a_photo),
        tooltip: 'Pick Image',
        onPressed: _optionsDialogBox,
      );
    } else {
      return FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            _image = null;
            _outputs = null; // Reset outputs as well
          });
        },
      );
    }
  }
  
  FlatButton({required Null Function() onPressed, required Icon child}) {}
}
