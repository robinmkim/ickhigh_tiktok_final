import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ickhigh_tiktok_final/common/main_navigation_screen.dart';
import 'package:ickhigh_tiktok_final/features/authentication/repos/authentication_repo.dart';
import 'package:ickhigh_tiktok_final/features/authentication/views/log_in_screen.dart';
import 'package:ickhigh_tiktok_final/features/authentication/views/sign_up_screen.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.matchedLocation != SignUpScreen.routeURL &&
            state.matchedLocation != LogInScreen.routeURL) {
          return SignUpScreen.routeURL;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeURL,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: LogInScreen.routeName,
        path: LogInScreen.routeURL,
        builder: (context, state) => const LogInScreen(),
      ),
      GoRoute(
        path: "/:tab(home|post)",
        name: MainNavigationScreen.routeName,
        builder: (context, state) {
          final tab = state.pathParameters["tab"]!;
          return MainNavigationScreen(tab: tab);
        },
      ),
    ],
  );
});
