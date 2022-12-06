import 'package:blog_platform_app/services/time_service.dart';

enum BlogStatus { active, inactive, draft }

class BlogModel {
  String? blogID;
  String creatorID, title, content, imageUrl, publishedDate, modifiedDate;
  int likes, views, publishedDateUnix, modifiedDateUnix;
  BlogStatus status;
  Set<String> tags;

  //TODO: Make the creation of publishedDate better
  BlogModel({
    this.blogID,
    this.modifiedDate = "",
    this.publishedDate = "",
    required this.creatorID,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.likes,
    required this.views,
    required this.publishedDateUnix,
    required this.modifiedDateUnix,
    required this.status,
    required this.tags,
  }) {
    TimeHelper timeHelper = TimeHelper();
    publishedDate = timeHelper.relativeTime(publishedDateUnix);
    modifiedDate = timeHelper.relativeTime(modifiedDateUnix);
  }

  @override
  String toString() {
    return "BlogModel:\n"
        "   Blog ID: $blogID,\n"
        "   Creator ID: $creatorID,\n"
        "   Title: $title,\n"
        "   Status: ${status.name}\n"
        "   Tags: $tags\n";
  }
}
