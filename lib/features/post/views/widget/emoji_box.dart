import 'package:flutter/material.dart';

class EmojiBox extends StatelessWidget {
  final String emoji;
  final bool filled;

  const EmojiBox({
    Key? key,
    required this.emoji,
    this.filled = false, // Provide a default value of false.
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
          color: filled ? Colors.blue : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Text(
            emoji,
            style: TextStyle(
              fontSize: 30,
              color: filled
                  ? Colors.white
                  : null, // Set the text color when filled.
            ),
          ),
        ),
      ),
    );
  }
}
