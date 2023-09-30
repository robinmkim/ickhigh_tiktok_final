import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ickhigh_tiktok_final/features/post/repos/post_repo.dart';

class PostUploadViewModel extends AsyncNotifier<void> {
  late final PostRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(postRepo);
  }
}
