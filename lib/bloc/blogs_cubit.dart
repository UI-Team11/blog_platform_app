import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:blog_platform_app/models/blog_model.dart';

part 'blogs_state.dart';

class BlogsCubit extends Cubit<BlogsState> {
  BlogsCubit() : super(const BlogsLoadedState(blogs: {}));

  CollectionReference blogsCollection =
      FirebaseFirestore.instance.collection('blogs');

  Future<void> loadBlogs() async {}

  Future<void> saveBlog(BlogModel blog) async {
    Map<String, BlogModel> blogs;

    blogs = state.blogs;

    emit(BlogsLoadingState(blogs: blogs));

    blogsCollection.add({
      'creatorID': blog.creatorID,
      'title': blog.title,
      'content': blog.content,
      'imageUrl': blog.imageUrl,
      'likes': blog.likes,
      'views': blog.views,
      'publishedDateUnix': blog.publishedDateUnix,
      'modifiedDateUnix': blog.modifiedDateUnix,
      'status': blog.status.toString(),
      'tags': blog.tags,
    }).then((value) {
      print("Document ID: ${value.id}");
      emit(BlogsLoadedState(blogs: blogs));
    }).catchError((error) {
      print(error);
      emit(BlogsErrorState(message: "Error saving blog", blogs: blogs));
    });
  }

  Future<void> updateBlog() async {
    Map<String, BlogModel> blogs = state.blogs;

    emit(BlogsLoadingState(blogs: blogs));
  }
}
