import 'package:blog_platform_app/models/blog_model.dart';
import 'package:blog_platform_app/screens/blog_view_screen.dart';
import 'package:flutter/material.dart';
import '../custom_theme.dart';

const double maxThumbnailSize = 200;

class AlternativeBlogThumbnail extends StatelessWidget {
  final BlogModel blog;

  const AlternativeBlogThumbnail({Key? key, required this.blog}) : super(key: key);

  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: maxThumbnailSize,
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BlogViewScreen(
                  blog: blog,
                ),
              ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: maxThumbnailSize * 0.6,
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.network(
                          blog.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: maxThumbnailSize * 0.02),
                Text(
                  blog.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: maxThumbnailSize * 0.07),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.thumb_up, size: maxThumbnailSize * 0.06),
                    SizedBox(width: maxThumbnailSize * 0.02),
                    Text(
                      "${blog.likes} Likes · ${blog.publishedDate}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: maxThumbnailSize * 0.06),
                    ),
                    // const Expanded(child: SizedBox()),
                    // Text(
                    //   blog.publishedDate,
                    //   textAlign: TextAlign.center,
                    //   style: const TextStyle(fontSize: maxThumbnailSize * 0.06),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
