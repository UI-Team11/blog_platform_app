part of 'blogs_cubit.dart';

abstract class BlogsState extends Equatable {
  final Map<String, BlogModel> blogs;

  const BlogsState({required this.blogs});

  @override
  List<Object> get props => [blogs];
}

class BlogsInitialState extends BlogsState {
  const BlogsInitialState({required Map<String, BlogModel> blogs})
      : super(blogs: blogs);
}

class BlogsLoadingState extends BlogsState {
  const BlogsLoadingState({required Map<String, BlogModel> blogs})
      : super(blogs: blogs);
}

class BlogsLoadedState extends BlogsState {
  const BlogsLoadedState({required Map<String, BlogModel> blogs})
      : super(blogs: blogs);
}

class BlogsErrorState extends BlogsState {
  final String? message;

  const BlogsErrorState({required this.message, required Map<String, BlogModel> blogs})
      : super(blogs: blogs);
}
