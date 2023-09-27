import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ickhigh_tiktok_final/features/authentication/views/log_in_screen.dart';
import 'package:ickhigh_tiktok_final/features/authentication/views/username_screen.dart';
import 'package:ickhigh_tiktok_final/features/authentication/views/widgets/login_type_button.dart';

class SignUpScreen extends StatelessWidget {
  static const routeURL = "/";
  static const routeName = "signUp";
  const SignUpScreen({super.key});

  void onLoginTap(BuildContext context) {
    context.pushNamed(LogInScreen.routeName);
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const UsernameScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to MOOD"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Sign up for MOOD',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Opacity(
                opacity: 0.7,
                child: Text(
                  "Create a profile, follow other accounts, make your own videos, and more.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () => _onEmailTap(context),
                child: const LoginTypeBox(
                  icon: FaIcon(FontAwesomeIcons.user),
                  text: "Use email & password",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const LoginTypeBox(
                icon: FaIcon(FontAwesomeIcons.apple),
                text: "Continue with Apple",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an accout?",
                ),
                const SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () => onLoginTap(context),
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
