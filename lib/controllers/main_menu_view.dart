import 'package:blog_platform_app/controllers/authentication_popup.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_theme.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_util.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_widgets.dart';
import 'package:blog_platform_app/screens/categories_screen.dart';
import 'package:blog_platform_app/screens/create_blog_screen.dart';
import 'package:blog_platform_app/screens/home_screen.dart';
import 'package:blog_platform_app/screens/profile_screen.dart';
import 'package:blog_platform_app/screens/published_blogs_screen.dart';
import 'package:blog_platform_app/screens/sign_up_screen.dart';
import 'package:blog_platform_app/screens/subscriptions_screen.dart';
import 'package:blog_platform_app/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:blog_platform_app/screens/login_screen.dart';
import 'package:blog_platform_app/custom_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_cubit.dart';

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
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 10),
          //   child: Center(
          //     child: SizedBox(
          //       height: kToolbarHeight / 1.3,
          //       width: kToolbarHeight / 1.3,
          //       child: ElevatedButton(
          //         onPressed: () {
          //           Navigator.of(context).pop();
          //           showDialog(
          //             context: context,
          //             builder: (context) {
          //               return ProfileScreen();
          //             },
          //           );
          //         },
          //         child: const Center(
          //           child: Text("J"),
          //         ),
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: blueNavy[300],
          //
          //           //fixedSize: const Size(200, 200),
          //           shape: const CircleBorder(),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          BlocBuilder<AuthCubit, AuthState>(builder: (context, currState) {
            if (currState is AuthSignedInState) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Center(
                  child: SizedBox(
                    height: kToolbarHeight / 1.5,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<AuthCubit>().signOut();
                      },
                      child: const Center(
                        child: Text("Sign Out"),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,

                        //fixedSize: const Size(200, 200),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
              );
            }

            return const SizedBox();
          }),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(primaryColorDark),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //TODO: Update this button to go to the profile of the user when the user is signed in
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
                      backgroundColor: blueNavy[300],

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
              text: "CATEGORIES",
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
            Expanded(flex: 1, child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListTile(
                title: const Center(
                  child: Text("SIGN OUT",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                onTap: () => context.read<AuthCubit>().signOut(),
                hoverColor: const Color(0x11FFFFFF),
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: [
            //ProfileScreen(),
            //SubscriptionsScreen()
            HomeScreen(),
            CategoryScreen(),
            CreateBlogScreen(),
            PublishedBlogScreen(),
            // SubscriptionsScreen(), // TODO: FIX THIS
            Container(),
          ],
        ),
      ),
    );
  }
}
