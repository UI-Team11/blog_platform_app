import 'package:blog_platform_app/bloc/blogs_cubit.dart';
import 'package:blog_platform_app/models/blog_model.dart';
import 'package:blog_platform_app/widgets/blogs_grid_view.dart';
import 'package:blog_platform_app/widgets/bottom_loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../custom_theme.dart';
import '../lib/flutter_flow/flutter_flow_theme.dart';
import '../lib/flutter_flow/flutter_flow_widgets.dart';
import '../widgets/category_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String filterValue = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogsCubit, BlogsState>(builder: (context, currState) {
      List<BlogModel> filteredBlogs = [];
      Set<String> tags = {};
      List<String> tagList = [];

      if (currState is BlogsErrorState) {
        return Center(child: Text("Error: ${currState.message}"));
      }
      if (currState is BlogsLoadingState) {
        return LoaderIndicator();
      }

      if (filterValue != "") {

        for (BlogModel blog in currState.blogs.values) {
          if (filterValue == "" || blog.tags.contains(filterValue)) {
            filteredBlogs.add(blog);
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                icon: Icon(Icons.arrow_circle_left_outlined),
                iconSize: kToolbarHeight * 0.6,
                onPressed: (){
                setState(() {
                  filterValue = "";
                });
              },),
            ),
            Flexible(child: BlogsGirdView(blogs: filteredBlogs)),
          ],
        );
      }

      for (BlogModel blog in currState.blogs.values) {
        for (String tag in blog.tags) {
          tags.add(tag);
        }
      }

      tagList = tags.toList();

      return GridView.builder(
        padding: const EdgeInsets.all(20),
        controller: ScrollController(),
        itemCount: tagList.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          maxCrossAxisExtent: maxCategoryCardSize,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.height / 6,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  filterValue = tagList[index];
                });
              },
              child: Center(
                child: Text(tagList[index]),
              ),
              style: ElevatedButton.styleFrom(
                //primary: blueNavy[300],
                //fixedSize: const Size(200, 200),
                shape: const RoundedRectangleBorder(),
              ),
            ),
          );
        },
      );
    });
  }
}
