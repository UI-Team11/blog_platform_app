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
    return BlocBuilder<BlogsCubit, BlogsState>(
      builder: (context, currState) {
        List<BlogModel> filteredBlogs = [];
        List<String> keys = currState.blogs.keys.toList();

        User? user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          return const Center(child: Text("Error: Please sign in"));
        }

        if (currState is BlogsErrorState) {
          return Center(child: Text("Error: ${currState.message}"));
        }
        if (currState is BlogsLoadingState) {
          return LoaderIndicator();
        }

        for (BlogModel blog in currState.blogs.values) {
          if (blog.creatorID == user.uid) {
            filteredBlogs.add(blog);
          }
        }
        if (filteredBlogs.isEmpty) {
          return const Center(child: Text("You are not created any blog"));
        }

        return SizedBox(
          child: ListView.builder(
            padding: const EdgeInsets.all(20),
            controller: ScrollController(),
            itemCount: filteredBlogs.length,
            itemBuilder: (BuildContext context, int index) {
              return BlogThumbnail(blog: filteredBlogs[index]!);
            },
          ),
        );
      },
    );
  }
}
