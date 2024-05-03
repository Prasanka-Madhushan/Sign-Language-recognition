import 'package:flutter/material.dart';

class SignLanguageEntry {
  final String word;
  final String definition;
  final String imageUrl;

  SignLanguageEntry(
      {required this.word, required this.definition, required this.imageUrl});
}

class SignLanguageDictionaryPage extends StatefulWidget {
  @override
  _SignLanguageDictionaryPageState createState() =>
      _SignLanguageDictionaryPageState();
}

class _SignLanguageDictionaryPageState
    extends State<SignLanguageDictionaryPage> {
  final List<SignLanguageEntry> entries = [
    SignLanguageEntry(
      word: "Hello",
      definition: "A greeting used when meeting someone.",
      imageUrl: "images/dict/hello.png",
    ),
    SignLanguageEntry(
      word: "Thank You",
      definition:
          "A polite expression used when acknowledging a gift, service, or compliment.",
      imageUrl: "images/dict/thankyou.png",
    ),
    SignLanguageEntry(
      word: "Sorry",
      definition: "An expression of apology or regret.",
      imageUrl: "images/dict/sorry.png",
    ),
    SignLanguageEntry(
      word: "Please",
      definition: "A polite expression used when asking for something.",
      imageUrl: "images/dict/please.png",
    ),
    SignLanguageEntry(
      word: "Goodbye",
      definition: "A farewell used when parting.",
      imageUrl: "images/dict/goodbye.png",
    ),
    SignLanguageEntry(
      word: "Love",
      definition: "A strong feeling of affection.",
      imageUrl: "images/dict/love.png",
    ),
    SignLanguageEntry(
      word: "Friend",
      definition:
          "A person whom one knows and with whom one has a bond of mutual affection.",
      imageUrl: "images/dict/friends.png",
    ),
    SignLanguageEntry(
      word: "Family",
      definition:
          "A group consisting of parents and children living together in a household.",
      imageUrl: "images/dict/family.png",
    ),
    SignLanguageEntry(
      word: "Help",
      definition:
          "To make it easier for (someone) to do something by offering one's services or resources.",
      imageUrl: "images/dict/help.png",
    ),
    SignLanguageEntry(
      word: "Eat",
      definition: "Put (food) into the mouth and chew and swallow it.",
      imageUrl: "images/dict/eat.png",
    ),
    SignLanguageEntry(
      word: "Drink",
      definition: "Take (a liquid) into the mouth and swallow.",
      imageUrl: "images/dict/drink.png",
    ),
    SignLanguageEntry(
      word: "Happy",
      definition: "Feeling or showing pleasure or contentment.",
      imageUrl: "images/dict/happy.png",
    ),
    SignLanguageEntry(
      word: "Sad",
      definition: "Feeling or showing sorrow; unhappy.",
      imageUrl: "images/dict/sad.png",
    ),
    SignLanguageEntry(
      word: "School",
      definition: "An institution for educating children.",
      imageUrl: "images/dict/school.png",
    ),
    SignLanguageEntry(
      word: "Work",
      definition:
          "Activity involving mental or physical effort done in order to achieve a purpose or result.",
      imageUrl: "images/dict/work.png",
    ),
  ];

  // This will hold the filtered entries for display in the UI
  List<SignLanguageEntry> filteredEntries = [];

  // This controller will control the text input for the search functionality
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    filteredEntries = entries;
    _searchController.addListener(_filterEntries);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterEntries);
    _searchController.dispose();
    super.dispose();
  }

  void _filterEntries() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() => filteredEntries = entries);
    } else {
      setState(() {
        filteredEntries = entries
            .where((entry) =>
                entry.word.toLowerCase().contains(query) ||
                entry.definition.toLowerCase().contains(query))
            .toList();
      });
    }
  }

//UI Design
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignSavvy Dictionary'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for a word',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _searchController.clear(),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEntries.length,
              itemBuilder: (context, index) {
                final entry = filteredEntries[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(entry.imageUrl),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(entry.word,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(entry.definition),
                    trailing:
                        Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SignLanguageDictionaryPage(),
  ));
}
