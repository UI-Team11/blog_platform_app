import 'package:blog_platform_app/main_menu_view.dart';
import 'package:flutter/material.dart';
import 'custom_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blog_platform_app/firebase_options.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: blueNavy,
        ),
      ),
      home: const MainMenuView(),
    );
  }
}
