import 'package:blog_platform_app/bloc/auth_cubit.dart';
import 'package:blog_platform_app/screens/sign_up_screen.dart';
import 'package:blog_platform_app/widgets/bottom_loader_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_theme.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  final void Function() onSignUpPressed;

  const LoginScreen(this.onSignUpPressed, {Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

    context.read<AuthCubit>().signInWithEmail(
          email: _email,
          password: _password,
        );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.43,
      width: MediaQuery.of(context).size.height * 0.5,
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, currState) {
          if (currState is AuthLoadingState) {
            return LoaderIndicator();
          }
          if (currState is AuthSignedInState) {
            return Column(
              children: [
                Text(FirebaseAuth.instance.currentUser!.displayName ??
                    "No username"),
                FloatingActionButton(onPressed: () {
                  context.read<AuthCubit>().signOut();
                }),
              ],
            );
          }
          return SafeArea(
            child: Form(
              key: _formKey,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  //mainAxisSize: MainAxisSize.max,
                  //mainAxisAlignment: MainAxisAlignment.center,
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
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    ElevatedButton(
                      child: Text(
                        "Log In",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        //primary: blueNavy[300],
                        fixedSize: Size.fromHeight(45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        _submit();
                      },
                    ),

                    SizedBox(height: 30),
                    ElevatedButton(
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        //primary: blueNavy[300],
                        fixedSize: Size.fromHeight(45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        context.read<AuthCubit>().resetAuthState();
                        widget.onSignUpPressed();
                      },
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
