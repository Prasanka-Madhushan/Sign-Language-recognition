import 'package:flutter/material.dart';

// Example data class for sign language entries
class SignLanguageEntry {
  final String word;
  final String definition;
  final String imageUrl;

  SignLanguageEntry({required this.word, required this.definition, required this.imageUrl});
}

// SignLanguageDictionaryPage Widget
class SignLanguageDictionaryPage extends StatefulWidget {
  @override
  _SignLanguageDictionaryPageState createState() => _SignLanguageDictionaryPageState();
}

class _SignLanguageDictionaryPageState extends State<SignLanguageDictionaryPage> {
  final List<SignLanguageEntry> entries = [
    SignLanguageEntry(
      word: "Hello",
      definition: "A greeting used when meeting someone.",
      imageUrl: "images/sign.png", // Example image path in your assets
    ),
    SignLanguageEntry(
      word: "Thank You",
      definition: "A polite expression used when acknowledging a gift, service, or compliment.",
      imageUrl: "images/collaboration.png",
    ),
    SignLanguageEntry(
      word: "Sorry",
      definition: "An expression of apology or regret.",
      imageUrl: "images/sign.png", // Adjust image path as necessary
    ),
    SignLanguageEntry(
      word: "Please",
      definition: "A polite expression used when asking for something.",
      imageUrl: "images/collaboration.png", // Adjust image path as necessary
    ),
    SignLanguageEntry(
      word: "Goodbye",
      definition: "A farewell used when parting.",
      imageUrl: "images/sign.png", // Adjust image path as necessary
    ),
    SignLanguageEntry(
      word: "Love",
      definition: "A strong feeling of affection.",
      imageUrl: "images/collaboration.png", // Adjust image path as necessary
    ),
    SignLanguageEntry(
      word: "Friend",
      definition: "A person whom one knows and with whom one has a bond of mutual affection.",
      imageUrl: "images/sign.png", // Adjust image path as necessary
    ),
    // New entries added below
    SignLanguageEntry(
      word: "Family",
      definition: "A group consisting of parents and children living together in a household.",
      imageUrl: "images/sign.png",
    ),
    SignLanguageEntry(
      word: "Help",
      definition: "To make it easier for (someone) to do something by offering one's services or resources.",
      imageUrl: "images/collaboration.png",
    ),
    SignLanguageEntry(
      word: "Eat",
      definition: "Put (food) into the mouth and chew and swallow it.",
      imageUrl: "images/sign.png",
    ),
    SignLanguageEntry(
      word: "Drink",
      definition: "Take (a liquid) into the mouth and swallow.",
      imageUrl: "images/collaboration.png",
    ),
    SignLanguageEntry(
      word: "Happy",
      definition: "Feeling or showing pleasure or contentment.",
      imageUrl: "images/sign.png",
    ),
    SignLanguageEntry(
      word: "Sad",
      definition: "Feeling or showing sorrow; unhappy.",
      imageUrl: "images/collaboration.png",
    ),
    SignLanguageEntry(
      word: "School",
      definition: "An institution for educating children.",
      imageUrl: "images/sign.png",
    ),
    SignLanguageEntry(
      word: "Work",
      definition: "Activity involving mental or physical effort done in order to achieve a purpose or result.",
      imageUrl: "images/collaboration.png",
    ),
];


  // This controller will control the text input for the search functionality
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Language Dictionary'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for a word',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // Optional: Implement search functionality here
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];
                return ListTile(
                  leading: Image.asset(entry.imageUrl, width: 50, height: 50),
                  title: Text(entry.word),
                  subtitle: Text(entry.definition),
                  onTap: () {
                    // Optional: Implement onTap to navigate to a detailed page for each entry
                  },
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
