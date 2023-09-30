import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ickhigh_tiktok_final/features/post/view_models/post_upload_view_model.dart';
import 'package:ickhigh_tiktok_final/features/post/views/widget/emoji_box.dart';

class PostScreen extends ConsumerStatefulWidget {
  static const routeName = "/post";
  const PostScreen({super.key});

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  final TextEditingController _textController = TextEditingController();
  String _selectedEmoji = "";
  String _text = "";
  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _text = _textController.text;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textController.dispose();
  }

  void setEmoji(String emoji) {
    setState(() {
      _selectedEmoji = emoji;
    });
    print(_selectedEmoji);
  }

  void onPost() {
    print("emoji$_selectedEmoji");
    print(_text);
    ref
        .read(postUploadProvider.notifier)
        .uploadPost(_selectedEmoji, _text, context);
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildEmojiBox("😀"),
                _buildEmojiBox("🙁"),
                _buildEmojiBox("😤"),
                _buildEmojiBox("😡"),
                _buildEmojiBox("😨"),
                _buildEmojiBox("🤔"),
                _buildEmojiBox("😵‍💫"),
                _buildEmojiBox("🤒"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(),
              ),
              child: TextField(
                controller: _textController,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: "How's your mood today?",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: GestureDetector(
                onTap: onPost,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(),
                  ),
                  child: const Text("Post"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEmojiBox(String emoji) {
    final isSelected = emoji == _selectedEmoji;
    return GestureDetector(
      onTap: () => setEmoji(emoji),
      child: EmojiBox(
        emoji: emoji,
        filled: isSelected, // Pass the isSelected status to EmojiBox.
      ),
    );
  }
}
