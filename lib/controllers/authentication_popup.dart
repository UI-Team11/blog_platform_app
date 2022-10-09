import 'package:flutter/material.dart';
import 'package:blog_platform_app/custom_theme.dart';
import 'package:blog_platform_app/screens/login_screen.dart';
import 'package:blog_platform_app/screens/sign_up_screen.dart';

class AuthenticationPopup extends StatefulWidget {
  final bool isSignInScreen;

  const AuthenticationPopup({Key? key, required this.isSignInScreen})
      : super(key: key);

  @override
  State<AuthenticationPopup> createState() => _AuthenticationPopupState();
}

class _AuthenticationPopupState extends State<AuthenticationPopup> {
  late bool _isSignInScreen;

  @override
  void initState() {
    _isSignInScreen = widget.isSignInScreen;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(backgroundColor),
      content: (_isSignInScreen)
          ? LoginScreen(() {
              setState(() {
                _isSignInScreen = false;
              });
            })
          : SignUpScreen(() {
              setState(() {
                _isSignInScreen = true;
              });
            }),
      title: Center(
        child: Text((_isSignInScreen) ? "Log In" : "Sign Up"),
      ),
    );
  }
}
