import 'package:blog_platform_app/bloc/blogs_cubit.dart';
import 'package:blog_platform_app/custom_theme.dart';
import 'package:blog_platform_app/models/blog_model.dart';
import 'package:blog_platform_app/widgets/blogs_grid_view.dart';
import 'package:blog_platform_app/widgets/bottom_loader_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  final String filterValue;

  const SearchScreen({Key? key, required this.filterValue}) : super(key: key);

  get icon => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(backgroundColor),
      appBar: AppBar(),
      body: BlocBuilder<BlogsCubit, BlogsState>(
        builder: (context, currState) {
          List<BlogModel> filteredBlogs = [];

          if (currState is BlogsErrorState) {
            return Center(child: Text("Error: ${currState.message}"));
          }

          if (currState is BlogsLoadingState) {
            return LoaderIndicator();
          }

          for (BlogModel blog in currState.blogs.values) {
            if (filterValue == "" ||
                blog.title.toLowerCase().contains(filterValue.toLowerCase())) {
              filteredBlogs.add(blog);
            }
          }

          return Column(
            children: [
              Flexible(child: BlogsGridView(blogs: filteredBlogs)),
            ],
          );
        },
      ),
    );
  }
}
