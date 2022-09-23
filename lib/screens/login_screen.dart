import 'package:blog_platform_app/bloc/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_theme.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = "";
  String _password = "";
  String _username = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.height * 0.5,
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, currState) {
          if (currState is AuthErrorState) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).errorColor,
                content: Text(
                  currState.message ?? "Error",
                  style: TextStyle(color: Theme.of(context).colorScheme.onError),
                ),
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
        builder: (context, currState) {
          if (currState is AuthSignedInState) {
            return Column(
              children: [
                Text(FirebaseAuth.instance.currentUser!.displayName ?? "No username"),
                FloatingActionButton(onPressed: () {
                  context.read<AuthCubit>().signOut();
                }),
              ],
            );
          }
          return SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                //mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Text"),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      onChanged: (value) => _email = value,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 13,
                          horizontal: 10,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      onChanged: (value) => _username = value,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 13,
                          horizontal: 10,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      onChanged: (value) => _password = value,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) {
                        context.read<AuthCubit>().signInWithEmail(
                              email: _email,
                              password: _password,
                            );
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 13,
                          horizontal: 10,
                        ),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                      context.read<AuthCubit>().signInWithEmail(
                            email: _email,
                            password: _password,
                          );
                    },
                    text: 'Log In',
                    options: FFButtonOptions(
                      width: 100,
                      height: 40,
                      color: Color(0xFF476072),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      //borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                      context.read<AuthCubit>().signUpWithEmail(
                            email: _email,
                            password: _password,
                            username: _username,
                          );
                    },
                    text: 'Sign Up',
                    options: FFButtonOptions(
                      width: 100,
                      height: 40,
                      color: Color(0xFF476072),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      //borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
