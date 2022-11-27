import 'package:blog_platform_app/models/blog_model.dart';
import 'package:blog_platform_app/screens/blog_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:blog_platform_app/services/time_service.dart';
import '../custom_theme.dart';

const double maxThumbnailSize = 250;

class BlogThumbnail extends StatelessWidget {
  BlogModel blog;

 BlogThumbnail({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimeHelper _timeHelper = TimeHelper();

    return SizedBox(
      width: maxThumbnailSize,
      height: maxThumbnailSize,
      child: Column(
        children: [
          Expanded(
            //TODO: Add images in storage
            child: ElevatedButton(
              child: Container(
              ),
              onPressed: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => BlogViewScreen(
                    blog: blog,
                  ),
                ));
              },
            ),
          ),
          Text(blog.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("${blog.likes} Likes"),
              const Expanded(child: SizedBox()),
              Text(_timeHelper.dateFromTimestamp(blog.modifiedDateUnix)),
            ],
          ),

        ],
      ),
    );
  }
}
