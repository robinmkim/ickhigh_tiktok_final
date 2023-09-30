class PostModel {
  final String emoji;
  final String text;
  final String uid;
  final int createdAt;

  PostModel({
    required this.emoji,
    required this.text,
    required this.uid,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "emoji": emoji,
      "text": text,
      "uid": uid,
      "createdAt": createdAt,
    };
  }
}
