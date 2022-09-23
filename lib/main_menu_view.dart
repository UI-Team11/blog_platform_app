import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_theme.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_util.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_widgets.dart';
import 'package:blog_platform_app/screens/home_screen.dart';
import 'package:blog_platform_app/widgets/drawer_item.dart';
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
                    shape: const CircleBorder(),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            backgroundColor: Color(backgroundColor),
                            content: LoginScreen(),
                          );
                        },
                      );
                    },
                    child: const Center(
                      child: Text("Sign In"),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: blueNavy[300],
                      //fixedSize: const Size(200, 200),
                      shape: const CircleBorder(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DrawerItem(text: "HOME", icon: Icons.home, onTapFunc: (){}),
            const SizedBox(height: 20),
            DrawerItem(text: "CATEGORY", icon: Icons.category, onTapFunc: (){}),
            const SizedBox(height: 20),
            DrawerItem(text: "CREATE BLOG", icon: Icons.add_box, onTapFunc: (){}),
            const SizedBox(height: 20),
            DrawerItem(text: "YOUR BLOGS", icon: Icons.newspaper, onTapFunc: (){}),
            const SizedBox(height: 20),
            DrawerItem(text: "SUBSCRIPTIONS", icon: Icons.person, onTapFunc: (){}),
          ],
        ),
      ),
      body: HomeScreen(),
    );
  }
}
