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
    CommunityStory(
      title: "A Family Affair",
      user: "Mia",
      story: "My whole family started learning to sign together. It's brought us closer!",
    ),
    CommunityStory(
      title: "Finding Community",
      user: "Carlos",
      story: "Joining a local signing club introduced me to many inspiring individuals.",
    ),
    CommunityStory(
      title: "Technology and Learning",
      user: "Priya",
      story: "Using apps and videos made it easier to learn and practice signing in my own time.",
    ),
    // New stories added below
    CommunityStory(
      title: "Unexpected Connections",
      user: "Eli",
      story: "Learning ASL opened up a new world of friendships I never expected.",
    ),
    CommunityStory(
      title: "Breaking Down Barriers",
      user: "Sophia",
      story: "ASL has helped me communicate with my deaf cousin for the first time. It's been incredible.",
    ),
    CommunityStory(
      title: "The Joy of Signing",
      user: "Liam",
      story: "Discovering the beauty of ASL has been one of the most rewarding experiences of my life.",
    ),
    CommunityStory(
      title: "From Learning to Teaching",
      user: "Olivia",
      story: "After mastering the basics, I now volunteer to teach ASL to newcomers in my community.",
    ),
    CommunityStory(
      title: "A Lifelong Journey",
      user: "Noah",
      story: "What started as a hobby has become a lifelong journey of learning and sharing ASL.",
    ),
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
