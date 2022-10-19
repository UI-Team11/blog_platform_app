import 'package:flutter/cupertino.dart';
import 'package:blog_platform_app/bloc/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_theme.dart';
import 'package:blog_platform_app/lib/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../custom_theme.dart';

class ViewBlogScreen extends StatefulWidget {
  const ViewBlogScreen({Key? key}) : super(key: key);

  @override
  State<ViewBlogScreen> createState() => _ViewBlogScreenState();
}

class _ViewBlogScreenState extends State<ViewBlogScreen> {
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromKey,
      child: Column(children: <Widget>[
        const SizedBox(height: 20),
        Title(
            color: const Color(secondaryColorDark),
            child: const Text("Created Blog Title",
                style: TextStyle(color: Color(secondaryColorDark)))),
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          child: Center(
            child: Container(
              child: Text("Blog Image"),
              height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.height / 1,
              decoration: ShapeDecoration(
                color: blueNavy[300],
                shape: const RoundedRectangleBorder(),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 8,
          child: Center(
            child: Container(
              child: Text("Author"),
              height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.height / 1,
              decoration: ShapeDecoration(
                color: Colors.blueGrey[300],
                shape: const RoundedRectangleBorder(),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          child: Center(
            child: Container(
              child: Text("Blog Text"),
              height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.height / 1,
              decoration: ShapeDecoration(
                color: blueLight[300],
                shape: const RoundedRectangleBorder(),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 12,
          child: Center(
            child: Container(
              child: Text("Sources Cited"),
              height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.height / 1,
              decoration: ShapeDecoration(
                color: blueNavy[300],
                shape: const RoundedRectangleBorder(),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
