import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  static const routeName = "/post";
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Post"),
    );
  }
}
