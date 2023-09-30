import 'package:flutter/material.dart';
import 'package:ickhigh_tiktok_final/features/post/views/widget/emoji_box.dart';

class PostScreen extends StatelessWidget {
  static const routeName = "/post";
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmojiBox(emoji: "😀"),
              EmojiBox(emoji: "🙁"),
              EmojiBox(emoji: "😤"),
              EmojiBox(emoji: "😡"),
              EmojiBox(emoji: "😨"),
              EmojiBox(emoji: "🤔"),
              EmojiBox(emoji: "😵‍💫"),
              EmojiBox(emoji: "🤒"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "How's your mood today?",
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
