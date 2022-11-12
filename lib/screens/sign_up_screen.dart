import 'package:blog_platform_app/widgets/bottom_loader_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_cubit.dart';

class SignUpScreen extends StatefulWidget {
  final void Function() onSignInPressed;

  const SignUpScreen(this.onSignInPressed, {Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _email = "";
  String _password = "";
  String _username = "";
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    context.read<AuthCubit>().signUpWithEmail(
      email: _email,
      password: _password,
      username: _username,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, currState) {
        if (currState is AuthLoadingState) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: const LoaderIndicator());
        }
        if (currState is AuthSignedInState) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: const LoaderIndicator());
        }
        return SafeArea(
          child: Form(
            key: _formKey,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  (currState is AuthErrorState)
                      ? Container(
                    alignment: AlignmentDirectional.center,
                    padding: EdgeInsetsDirectional.all(10),
                    child: Text(
                      currState.message ?? "Error",
                      style: TextStyle(color: Colors.red),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                    ),
                  )
                      : const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      onSaved: (value) => _email = value ?? "",
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty || value == "") {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 13,
                          horizontal: 10,
                        ),
                        labelText: "Email",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      onSaved: (value) => _username = value ?? "",
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty || value == "") {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 13,
                          horizontal: 10,
                        ),
                        labelText: "Username",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(

                      onSaved: (value) => _password = value ?? "",
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.isEmpty || value == "") {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        _submit();
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 13,
                          horizontal: 10,
                        ),
                        labelText: "Password",
                      ),
                      style: TextStyle(),
                    ),
                  ),

                  SizedBox(height: 40),
                  ElevatedButton(
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.white),
                    ),
                    onPressed: () {
                      _submit();
                    },
                  ),

                  SizedBox(height: 30),
                  ElevatedButton(
                    child: Text(
                      "Log In",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.white),
                    ),
                    onPressed: () {
                      context.read<AuthCubit>().resetAuthState();
                      widget.onSignInPressed();
                    },
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
