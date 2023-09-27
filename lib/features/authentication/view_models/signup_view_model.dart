import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ickhigh_tiktok_final/features/authentication/repos/authentication_repo.dart';
import 'package:ickhigh_tiktok_final/features/authentication/views/log_in_screen.dart';
import 'package:ickhigh_tiktok_final/features/users/view_models/users_view_model.dart';
import 'package:ickhigh_tiktok_final/utils.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    final users = ref.read(usersProvider.notifier);
    state = await AsyncValue.guard(() async {
      final userCredential = await _authRepo.emailSignUp(
        form["email"],
        form["password"],
      );
      await users.createProfile(userCredential);
    });
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.goNamed(LogInScreen.routeName);
    }
  }
}

final signUpForm = StateProvider((ref) => {});
final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
