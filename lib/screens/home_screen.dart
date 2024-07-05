import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'story_screen.dart';
import '../models/story.dart';
import '../widgets/story_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Story> stories;
  late List<Story> filteredStories = []; 

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadStories();
  }

  Future<void> loadStories() async {
    final String response = await rootBundle.loadString('lib/story_data.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      stories = data.map((storyJson) => Story.fromJson(storyJson)).toList();
      filteredStories =
          List.from(stories); 
    });
  }

  void filterSearchResults(String query) {
    List<Story> dummySearchList = [];
    dummySearchList.addAll(stories);
    if (query.isNotEmpty) {
      List<Story> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.title.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        filteredStories.clear();
        filteredStories.addAll(dummyListData);
      });
    } else {
      setState(() {
        filteredStories.clear();
        filteredStories.addAll(stories);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Reader'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  filterSearchResults(value);
                },
                decoration: InputDecoration(
                  labelText: "Cari cerita berdasarkan judul",
                  hintText: "Cari...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                itemCount: filteredStories.length,
                itemBuilder: (context, index) {
                  return StoryCard(story: filteredStories[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
