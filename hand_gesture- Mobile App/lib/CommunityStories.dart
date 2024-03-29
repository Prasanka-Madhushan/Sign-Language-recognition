import 'package:flutter/material.dart';

class CommunityStoriesPage extends StatelessWidget {
  final List<CommunityStory> stories = [
    CommunityStory(
      title: "My First Week Learning",
      user: "Alex",
      story: "It was challenging at first, but now I can sign basic phrases!",
    ),
    CommunityStory(
      title: "Overcoming Challenges",
      user: "Jordan",
      story: "I found it hard to remember signs, but practice with friends helped a lot.",
    ),
    // Add more stories here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Stories'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: ListView.builder(
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(story.title, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${story.user} says, \"${story.story}\""),
            ),
          );
        },
      ),
    );
  }
}

class CommunityStory {
  final String title;
  final String user;
  final String story;

  CommunityStory({required this.title, required this.user, required this.story});
}

