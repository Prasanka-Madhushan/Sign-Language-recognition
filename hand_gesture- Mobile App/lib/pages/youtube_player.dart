import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideo {
  final String title;
  final String videoId;
  final String thumbnailUrl;

  YoutubeVideo({
    required this.title,
    required this.videoId,
    required this.thumbnailUrl,
  });
}

// List of videos with added thumbnails
List<YoutubeVideo> youtubeVideos = [
  YoutubeVideo(
      title: "Sign Language for Beginners, 10 Tips to Start ASL",
      videoId: "xAQ9Pegg0gc",
      thumbnailUrl: "https://img.youtube.com/vi/xAQ9Pegg0gc/0.jpg"),
  YoutubeVideo(
      title: "The Real Reason ASL Signs Differ Across People",
      videoId: "NVoeTUSUn5c",
      thumbnailUrl: "https://img.youtube.com/vi/NVoeTUSUn5c/0.jpg"),
  YoutubeVideo(
      title: "25 ASL Signs You Need to Know, ASL Basics",
      videoId: "0FcwzMq4iWg",
      thumbnailUrl: "https://img.youtube.com/vi/0FcwzMq4iWg/0.jpg"),
  YoutubeVideo(
      title: "50 Basic ASL Conversational Signs",
      videoId: "CGqXy3JOZRs",
      thumbnailUrl: "https://img.youtube.com/vi/CGqXy3JOZRs/0.jpg"),
  YoutubeVideo(
      title: "Learn Sign Language",
      videoId: "DaMjr4AfYA0",
      thumbnailUrl: "https://img.youtube.com/vi/DaMjr4AfYA0/0.jpg"),
  YoutubeVideo(
      title: "Common ASL Phrases and Signs You Must know",
      videoId: "IzOQ1H1_rd8",
      thumbnailUrl: "https://img.youtube.com/vi/IzOQ1H1_rd8/0.jpg"),
  YoutubeVideo(
      title: "25 Easiest Signs to Remember in ASL",
      videoId: "Y6GOZu0qWaM",
      thumbnailUrl: "https://img.youtube.com/vi/Y6GOZu0qWaM/0.jpg"),
  YoutubeVideo(
      title: "100 Basic Signs",
      videoId: "ianCxd71xIo",
      thumbnailUrl: "https://img.youtube.com/vi/ianCxd71xIo/0.jpg"),
  YoutubeVideo(
      title: "Basic Sign Language for Caregivers of the Deaf/Hard of Hearing",
      videoId: "rkQZQhloXuE",
      thumbnailUrl: "https://img.youtube.com/vi/rkQZQhloXuE/0.jpg"),
  YoutubeVideo(
      title: "Learn the ASL Alphabet Fast",
      videoId: "DBQINq0SsAw",
      thumbnailUrl: "https://img.youtube.com/vi/DBQINq0SsAw/0.jpg"),
  YoutubeVideo(
      title: "30 Signs You Need to Know for Basic ASL Conversations",
      videoId: "_c--P6VRTUo",
      thumbnailUrl: "https://img.youtube.com/vi/_c--P6VRTUo/0.jpg"),
];

class YoutubeVideoListScreen extends StatelessWidget {
  final List<YoutubeVideo> videos;

  YoutubeVideoListScreen({Key? key, required this.videos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo, Colors.deepPurple.shade400],
          ),
        ),
        child: ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.all(8),
              color: Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          YoutubePlayerScreen(videoId: videos[index].videoId),
                    ),
                  );
                },
                leading: Image.network(videos[index].thumbnailUrl, width: 100),
                title: Text(
                  videos[index].title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                trailing: Icon(Icons.play_circle_fill, color: Colors.red),
              ),
            );
          },
        ),
      ),
    );
  }
}

class YoutubePlayerScreen extends StatefulWidget {
  final String videoId;

  YoutubePlayerScreen({Key? key, required this.videoId}) : super(key: key);

  @override
  _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Video'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.indigo],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Enjoy the Video!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
