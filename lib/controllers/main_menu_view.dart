import 'package:blog_platform_app/controllers/authentication_popup.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_theme.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_util.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_widgets.dart';
import 'package:blog_platform_app/screens/categories_screen.dart';
import 'package:blog_platform_app/screens/create_blog_screen.dart';
import 'package:blog_platform_app/screens/home_screen.dart';
import 'package:blog_platform_app/screens/published_blogs_screen.dart';
import 'package:blog_platform_app/screens/sign_up_screen.dart';
import 'package:blog_platform_app/screens/subscriptions_screen.dart';
import 'package:blog_platform_app/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:blog_platform_app/screens/login_screen.dart';
import 'package:blog_platform_app/custom_theme.dart';

class MainMenuView extends StatefulWidget {
  bool isSignInScreen = true;

  MainMenuView({Key? key}) : super(key: key);

  @override
  State<MainMenuView> createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  int selectedIndex = 0;

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
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.height / 6,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AuthenticationPopup(
                            isSignInScreen: widget.isSignInScreen,
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
            DrawerItem(
              text: "HOME",
              icon: Icons.home,
              onTapFunc: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 20),
            DrawerItem(
              text: "CATEGORY",
              icon: Icons.category,
              onTapFunc: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 20),
            DrawerItem(
              text: "CREATE BLOG",
              icon: Icons.add_box,
              onTapFunc: () {
                setState(() {
                  selectedIndex = 2;
                });
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 20),
            DrawerItem(
              text: "YOUR BLOGS",
              icon: Icons.newspaper,
              onTapFunc: () {
                setState(() {
                  selectedIndex = 3;
                });
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 20),
            DrawerItem(
              text: "SUBSCRIPTIONS",
              icon: Icons.person,
              onTapFunc: () {
                setState(() {
                  selectedIndex = 4;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: [
            HomeScreen(),
            CategoryScreen(),
            CreateBlogScreen(),
            PublishedBlogScreen(),
            SubscriptionsScreen(),
          ],
        ),
      ),
    );
  }
}
