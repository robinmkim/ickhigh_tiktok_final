import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ickhigh_tiktok_final/features/authentication/repos/authentication_repo.dart';
import 'package:ickhigh_tiktok_final/features/post/models/post_model.dart';
import 'package:ickhigh_tiktok_final/features/post/repos/post_repo.dart';
import 'package:ickhigh_tiktok_final/features/users/view_models/users_view_model.dart';

class PostUploadViewModel extends AsyncNotifier<void> {
  late final PostRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(postRepo);
  }

  Future<void> uploadPost(
      String emoji, String text, BuildContext context) async {
    final user = ref.read(authRepo).user;
    final userProfile = ref.read(usersProvider).value;
    if (userProfile != null) {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async {
        await _repository.saveVideo(
          PostModel(
            emoji: emoji,
            text: text,
            uid: user!.uid,
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
        context.pushReplacement("/home");
      });
    }
  }
}

final postUploadProvider = AsyncNotifierProvider<PostUploadViewModel, void>(
  () => PostUploadViewModel(),
);
