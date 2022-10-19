import 'package:blog_platform_app/bloc/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_theme.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/custom_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: Center(

        child: Container(
          //child: const Text("Profile", style: TextStyle(color: Colors.white)),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.height / 2,

          decoration: ShapeDecoration(
            image: null,

            color: blueNavy[300],
            shape: const CircleBorder(),

          ),
        ),
      ),
    );
  }
}
// child: Title(
//     color: Colors.white,
//     //child: Text("Create A Blog Form", style: TextStyle(color: Colors.white))),
// child: Center(
//     child: Text("Create A Blog Form", style: TextStyle(color: Colors.white)),
//  child: Container(
//    // child:
//     height: MediaQuery.of(context).size.height /2,
//     width: MediaQuery.of(context).size.height / 2,
//
//     decoration: ShapeDecoration(
//       image: null,
//
//       color: blueNavy[300],
//       shape: const CircleBorder(),
//
// )
// ),
// ),
// ),
