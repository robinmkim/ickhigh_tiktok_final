import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ickhigh_tiktok_final/common/darkmode/view_models/darkmode_view_model.dart';

class Darkmode extends ConsumerWidget {
  const Darkmode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile.adaptive(
      value: ref.watch(darkmodeProvider).isDark,
      onChanged: (value) =>
          ref.read(darkmodeProvider.notifier).setDarkMode(value),
      title: const Text("Dark Mode"),
      subtitle: const Text("Turn the app into a dark mode"),
    );
  }
}
