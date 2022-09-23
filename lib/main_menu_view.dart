import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_theme.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_util.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_widgets.dart';
import 'package:blog_platform_app/screens/categories_screen.dart';
import 'package:blog_platform_app/screens/create_blog_screen.dart';
import 'package:blog_platform_app/screens/home_screen.dart';
import 'package:blog_platform_app/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'custom_theme.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({Key? key}) : super(key: key);

  @override
  State<MainMenuView> createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(backgroundColor),
      appBar: AppBar(
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: const Color(primaryColorDark),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              color: const Color(secondaryColorDark),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.height / 6,
                  decoration: ShapeDecoration(
                    color: blueNavy[300],
                    shape: CircleBorder(),
                  ),
                  child: Center(child: Text("Sign In")),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text("HOME", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 20),
            Text("CATEGORY", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 20),
            Text("CREATE BLOG", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 20),
            Text("YOUR BLOGS", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 20),
            Text("SUBSCRIPTIONS", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
     // body: LoginScreen(),
     // body: HomeScreen(),

   //New Screens
    //body: CatergoryScreen(),
    //  body: CreateBlogScreen(),
   //   body:  SignUpScreen(),

    );
  }
}
