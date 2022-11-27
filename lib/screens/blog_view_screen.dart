import 'package:blog_platform_app/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:blog_platform_app/models/blog_model.dart';
/*
 * This widget is the page for previewing an article. It shows the image,
 * title, source, published date, and summary of the article. It also has
 * a button to read the full article in the source page. (shows the url of
 * the article)
 */

class BlogViewScreen extends StatelessWidget {
  final BlogModel blog;

  const BlogViewScreen({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 25),
          Text("Note: Styling will change in the future, this is just testing that everything works"),
          const SizedBox(height: 25),
          Row(
            children: [
              // Expanded(
              //   child: Image.network(
              //     blog.image,
              //     fit: BoxFit.cover,
              //     height: MediaQuery.of(context).size.height * 0.3,
              //   ),
              // ),
              Expanded(
                //TODO: Add images in storage
                child: Container(
                  // width: 100,
                  // height: 100,
                  color: const Color(secondaryColorDark),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  blog.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  //TODO: Replace ID with Name
                  "Source: Javier De La Rosa",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Published: ${blog.publishedDate}",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 25),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      "Content:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        blog.content,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(height: 1.4, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ),
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
