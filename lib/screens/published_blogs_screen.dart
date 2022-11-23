import 'package:flutter/material.dart';
import 'package:blog_platform_app/bloc/blogs_cubit.dart';
import 'package:blog_platform_app/custom_theme.dart';
import 'package:blog_platform_app/models/blog_model.dart';
import 'package:blog_platform_app/widgets/bottom_loader_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blog_platform_app/widgets/blog_thumbnail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_platform_app/widgets/bottom_loader_indicator.dart';

class PublishedBlogScreen extends StatefulWidget {
  const PublishedBlogScreen({Key? key}) : super(key: key);

  @override
  State<PublishedBlogScreen> createState() => _PublishedBlogScreenState();
}

class _PublishedBlogScreenState extends State<PublishedBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogsCubit, BlogsState>(builder: (context, currState) {
      List<String> keys = currState.blogs.keys.toList();

      if (currState is BlogsErrorState) {
        return Center(child: Text("Error: ${currState.message}"));
      }
      if (currState is BlogsLoadingState) {
        return LoaderIndicator();
      }
      return SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            controller: ScrollController(),
            itemCount: currState.blogs.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              maxCrossAxisExtent: maxThumbnailSize,
            ),
            itemBuilder: (BuildContext context, int index) {
              String id = keys[index];
              return BlogThumbnail(blog: currState.blogs[id]!);
            },
          ),
        ),
      );
    }
    );
  }
}


