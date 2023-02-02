class PostsModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostsModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}
