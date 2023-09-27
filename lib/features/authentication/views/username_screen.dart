import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ickhigh_tiktok_final/features/authentication/view_models/signup_view_model.dart';
import 'package:ickhigh_tiktok_final/features/authentication/views/log_in_screen.dart';
import 'package:ickhigh_tiktok_final/features/authentication/views/widgets/form_button.dart';

class UsernameScreen extends ConsumerStatefulWidget {
  const UsernameScreen({
    super.key,
  });

  @override
  ConsumerState<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends ConsumerState<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";
  bool _obscureText = true;
  String _username = '';
  String _email = '';
  DateTime initialDate = DateTime.now();
  bool isDateSelected = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isUsernameValid() {
    if (_username.length > 2) {
      return true;
    }
    return false;
  }

  bool _isEmailValid() {
    final regex = RegExp(r'^(?:\d{11}|[\w\.-]+@[\w\.-]+\.\w+)$');
    return regex.hasMatch(_email);
  }

  bool _isPasswordLengthValid() {
    return _password.isNotEmpty &&
        _password.length > 8 &&
        _password.length <= 20;
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
    setState(() {
      isDateSelected = true;
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  bool _isPasswordValid() {
    final regExp = RegExp(r"^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&+=!]).*$");
    return _password.isNotEmpty && regExp.hasMatch(_password);
  }

  void _onSubmit() {
    if (!_isPasswordLengthValid()) {
      return;
    }
    ref.read(signUpForm.notifier).state = {
      "email": _email,
      "password": _password,
    };
    ref.read(signUpProvider.notifier).signUp(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('Select a Date'),
          actions: <Widget>[
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: _setTextFieldDate,
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Done'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          leading: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 2),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          title: const Text("Join MOOD"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Create your account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: _usernameController,
                autocorrect: false,
                decoration: InputDecoration(
                  suffix: FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: 20,
                    color: _isUsernameValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                  hintText: "Username",
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  suffix: FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: 20,
                    color:
                        _isEmailValid() ? Colors.green : Colors.grey.shade400,
                  ),
                  hintText: "Phone number or email address",
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
                onEditingComplete: () {},
                obscureText: _obscureText,
                autocorrect: false,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade400,
                          size: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade400,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Make it strong!",
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: 20,
                    color: _isPasswordLengthValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "must be longer than 8 characters",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: 20,
                    color: _isPasswordValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Expanded(
                    child: Text(
                      "must include alpabet,numbers and at least one special character",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: _onSubmit,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: FormButton(
                      disabled: !_isEmailValid() ||
                          !_isUsernameValid() ||
                          !isDateSelected),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
