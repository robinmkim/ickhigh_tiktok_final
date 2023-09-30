import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ickhigh_tiktok_final/common/darkmode/repos/darkmode_repo.dart';
import 'package:ickhigh_tiktok_final/common/darkmode/view_models/darkmode_view_model.dart';
import 'package:ickhigh_tiktok_final/firebase_options.dart';
import 'package:ickhigh_tiktok_final/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final preferences = await SharedPreferences.getInstance();
  final repository = DarkmodeRepository(preferences);

  runApp(ProviderScope(overrides: [
    darkmodeProvider.overrideWith(() => DarkmodeViewModel(repository))
  ], child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode:
          ref.watch(darkmodeProvider).isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
