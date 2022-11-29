import 'package:flutter/material.dart';
import 'package:blog_platform_app/custom_theme.dart';
import 'package:blog_platform_app/screens/login_screen.dart';
import 'package:blog_platform_app/screens/sign_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_cubit.dart';

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
  return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, currState) {
        //TODO: Delete this
        // if (currState is AuthSignedInState) {
        //   Navigator.of(context, rootNavigator: true).pop();
        //   print("Pop!!");
        // }
      },
      builder: (context, currState) {

        if (currState is AuthSignedInState) {
          Navigator.of(context, rootNavigator: true).pop();
          print("Pop!!");
        }

        return AlertDialog(
          backgroundColor: const Color(backgroundColor),
          content: SizedBox(
            width: MediaQuery.of(context).size.height * 0.5,
            child: (_isSignInScreen)
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
          ),
          title: Center(
            child: Text((_isSignInScreen) ? "Log In" : "Sign Up"),
          ),
        );
      },
    );
  }
}
