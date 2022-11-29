import 'package:blog_platform_app/bloc/blogs_cubit.dart';
import 'package:blog_platform_app/bloc/subscriptions_cubit.dart';
import 'package:blog_platform_app/controllers/main_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blog_platform_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blog_platform_app/bloc/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) {
          AuthCubit authCubit = AuthCubit();

          FirebaseAuth.instance.authStateChanges().listen((User? user) {
            if (user == null) {
              authCubit.signOutListener();
            } else if (user.displayName != null) {
              authCubit.signInListener(authUser: user);
            }
          });
          return authCubit;
        }),
        BlocProvider<BlogsCubit>(create: (context) {
          return BlogsCubit()..loadBlogs();
        }),
        BlocProvider<SubscriptionsCubit>(create: (context) {
          return SubscriptionsCubit()..loadSubscriptions();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              //primary: blueNavy[300],
              fixedSize: Size.fromHeight(45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          //buttonTheme: ButtonThemeData(),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: blueNavy,
          ),
        ),
        home: MainMenuView(),
      ),
    );
  }
}
