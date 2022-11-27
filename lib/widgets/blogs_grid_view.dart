import 'package:blog_platform_app/widgets/blog_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:blog_platform_app/models/blog_model.dart';

class BlogsGirdView extends StatefulWidget {

  final List<BlogModel> blogs;

  const BlogsGirdView({Key? key, required this.blogs}) : super(key: key);

  @override
  State<BlogsGirdView> createState() => _BlogsGirdViewState();
}

class _BlogsGirdViewState extends State<BlogsGirdView> {

  @override
  Widget build(BuildContext context) {
    late final List<BlogModel> blogs = widget.blogs;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      controller: ScrollController(),
      itemCount: blogs.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        maxCrossAxisExtent: maxThumbnailSize,
      ),
      itemBuilder: (BuildContext context, int index) {
        return BlogThumbnail(blog: blogs[index]!);
      },
    );
  }
}



