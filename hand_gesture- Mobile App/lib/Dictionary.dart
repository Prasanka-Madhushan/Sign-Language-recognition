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
    // Add more entries here
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
                return ListTile(
                  leading: Image.asset(entries[index].imageUrl, width: 50, height: 50),
                  title: Text(entries[index].word),
                  subtitle: Text(entries[index].definition),
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
