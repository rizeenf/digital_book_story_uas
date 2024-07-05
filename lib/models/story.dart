class Story {
  final String title;
  final String synopsis;
  final List<String> content;
  final String cover;
  final String author;

  Story(
      {required this.title,
      required this.synopsis,
      required this.content,
      required this.cover,
      required this.author});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      title: json['title'],
      synopsis: json['synopsis'],
      content: List<String>.from(json['content']),
      cover: json['cover'],
      author: json['author'],
    );
  }
}
