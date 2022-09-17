import 'package:flutter/material.dart';

const double maxThumbnailSize = 200;

class BlogThumbnail extends StatelessWidget {
  const BlogThumbnail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: Column(
        children: [
          Container(
              width: 100,
              height: 100,
              color: Colors.red
          ),
          Text("Title"),
          Text("01/02/2022"),
        ],
      ),
    );
  }
}
