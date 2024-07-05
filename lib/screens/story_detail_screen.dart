import 'package:flutter/material.dart';
import '../models/story.dart';

class StoryDetailScreen extends StatelessWidget {
  final Story story;

  StoryDetailScreen({required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
      ),
      body: ListView.builder(
        itemCount: story.content.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(story.content[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          Navigator.popUntil(context, (route) => route.isFirst);
        },
      ),
    );
  }
}
