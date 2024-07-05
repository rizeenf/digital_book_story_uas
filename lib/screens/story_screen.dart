import 'package:flutter/material.dart';
import '../models/story.dart';
import 'story_detail_screen.dart';

class StoryScreen extends StatelessWidget {
  final Story story;

  StoryScreen({required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          SizedBox(height: 300, child: Image.network(story.cover)),
          const SizedBox(height: 20),
          Center(
              child: Text(
            story.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          const SizedBox(height: 20),
          Center(child: Text(" Author : ${story.author}")),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(story.synopsis),
          ),
          ElevatedButton(
            child: Text('Baca Selengkapnya'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryDetailScreen(story: story),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
