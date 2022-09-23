import 'package:flutter/material.dart';

import '../custom_theme.dart';

const double maxThumbnailSize = 250;

class BlogThumbnail extends StatelessWidget {
  const BlogThumbnail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxThumbnailSize,
      height: maxThumbnailSize,
      child: Column(
        children: [
          Expanded(
            child: Container(
              // width: 100,
              // height: 100,
              color: const Color(secondaryColorDark),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Title"),
              Text(" - "),
              Text("01/02/2022"),
            ],
          ),

        ],
      ),
    );
  }
}
