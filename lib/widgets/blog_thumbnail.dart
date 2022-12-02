import 'package:blog_platform_app/models/blog_model.dart';
import 'package:blog_platform_app/screens/blog_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:blog_platform_app/services/time_service.dart';
import '../custom_theme.dart';

const double maxThumbnailSize = 250;

class BlogThumbnail extends StatelessWidget {
  final BlogModel blog;

  const BlogThumbnail({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimeHelper _timeHelper = TimeHelper();

    return SizedBox(
      width: maxThumbnailSize,
      height: maxThumbnailSize,
      child:InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BlogViewScreen(
              blog: blog,
            ),
          ));
        },
        child: ListView(
          children: [
            Image.network(
              "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
              fit: BoxFit.cover,
            ),
            Text(blog.title, textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("${blog.likes} Likes", textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                const Expanded(child: SizedBox()),
                Text(_timeHelper.dateFromTimestamp(blog.modifiedDateUnix), textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
