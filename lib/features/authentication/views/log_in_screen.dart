import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ickhigh_tiktok_final/features/authentication/views/log_in_form_screen.dart';
import 'package:ickhigh_tiktok_final/features/authentication/views/widgets/login_type_button.dart';

class LogInScreen extends StatelessWidget {
  static String routeName = "login";
  static String routeURL = "/login";
  const LogInScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    context.pop();
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MOOD"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Log in to MOOD',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Create a profile, follow other accounts, make your own videos, and more.',
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () => _onEmailTap(context),
            child: const LoginTypeBox(
              icon: FaIcon(FontAwesomeIcons.user),
              text: "Log in with Email",
            ),
          )
        ]),
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
                  "Don't have an accout?",
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () => _onSignUpTap(context),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
