import 'package:blog_platform_app/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:blog_platform_app/widgets/blog_thumbnail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        itemCount: 100,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: maxThumbnailSize,
        ),
        itemBuilder: (BuildContext context, int index) {
          return BlogThumbnail();
        },
      ),
    );
  }
}
