enum BlogStatus { active, inactive, draft }

class BlogModel {
  String? blogID;
  String creatorID, title, content, imageUrl;
  int likes, views, publishedDateUnix, modifiedDateUnix;
  BlogStatus status;
  Set<String> tags;

  BlogModel({
    this.blogID,
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
  });
}
