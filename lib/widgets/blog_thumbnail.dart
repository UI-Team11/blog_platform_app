import 'package:blog_platform_app/models/blog_model.dart';
import 'package:blog_platform_app/screens/blog_view_screen.dart';
import 'package:flutter/material.dart';
import '../custom_theme.dart';

const double maxThumbnailSize = 252;

class BlogThumbnail extends StatelessWidget {
  final BlogModel blog;

  const BlogThumbnail({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxThumbnailSize,
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
                  child: Image.network(
                    blog.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: maxThumbnailSize * 0.02),
                Text(
                  blog.title,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: maxThumbnailSize * 0.055),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: maxThumbnailSize * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.thumb_up, size: maxThumbnailSize * 0.05),
                    SizedBox(width: maxThumbnailSize * 0.02),
                    Text(
                      "${blog.likes} Likes · ${blog.publishedDate}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: maxThumbnailSize * 0.05),
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
