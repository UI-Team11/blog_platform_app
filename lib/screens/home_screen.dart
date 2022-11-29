import 'package:blog_platform_app/bloc/blogs_cubit.dart';
import 'package:blog_platform_app/custom_theme.dart';
import 'package:blog_platform_app/models/blog_model.dart';
import 'package:blog_platform_app/widgets/bottom_loader_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blog_platform_app/widgets/blog_thumbnail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_platform_app/widgets/blogs_grid_view.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String filterValue = "";

  @override
  Widget build(BuildContext context) {
    BlogModel? blog;
    return BlocBuilder<BlogsCubit, BlogsState>(
      builder: (context, currState) {
        List<BlogModel> filteredBlogs = [];
        Set<String> tags = {};
        List<String> tagList = [];

        if (currState is BlogsErrorState) {
          return Center(child: Text("Error: ${currState.message}"));
        }

        if (currState is BlogsLoadingState) {
          return LoaderIndicator();
        }


        for (BlogModel blog in currState.blogs.values) {
          for (String tag in blog.tags) {
            tags.add(tag);
          }
        }

        tagList = tags.toList();

        for (BlogModel blog in currState.blogs.values) {
          if (filterValue == "" || blog.tags.contains(filterValue)) {
            filteredBlogs.add(blog);
          }
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: kToolbarHeight * 0.8,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(width: 5),
                  scrollDirection: Axis.horizontal,
                  itemCount: tagList.length,
                  itemBuilder: (BuildContext context, int index) {


                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        // height: kToolbarHeight,
                        //  width: kToolbarHeight,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              filterValue = (index == 0)? "" : tagList[index];
                            });
                          },
                          child: Center(
                            child: Text((index == 0)? "All" : tagList[index]),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(secondaryColor),
                            //primary: blueNavy[300],
                            //fixedSize: const Size(200, 200),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Flexible(child: BlogsGridView(blogs: filteredBlogs)),
          ],
        );
      },
    );
  }
}
