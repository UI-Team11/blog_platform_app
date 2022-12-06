import 'package:blog_platform_app/bloc/blogs_cubit.dart';
import 'package:blog_platform_app/bloc/likes_cubit.dart';
import 'package:blog_platform_app/models/blog_model.dart';
import 'package:blog_platform_app/models/like_model.dart';
import 'package:blog_platform_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeButton extends StatefulWidget {
  final BlogModel blog;
  final UserModel user;

  const LikeButton({Key? key, required this.blog, required this.user})
      : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    BlogModel blog = widget.blog;
    UserModel user = widget.user;

    return BlocBuilder<LikesCubit, LikesState>(builder: (context, currState) {
      LikeModel? like;
      bool isLiked = false;

      try {
        like = currState.likes.firstWhere(
          (element) {
            return element.blogID == blog.blogID && element.userID == user.id;
          },
        );
        isLiked = true;
      } catch (error) {
        isLiked = false;
        like = null;
      }

      return IconButton(
        padding: EdgeInsets.all(0.0),
        onPressed: () {
          //TODO: Susbcribe
          if (currState is LikesLoadingState) {
            return;
          }

          if (isLiked) {
            context.read<LikesCubit>().deleteLike(like!.likeID!);
            context.read<BlogsCubit>().updateBlog(
                  blogID: blog.blogID!,
                  likes: blog.likes - 1,
                );
          } else {
            context.read<LikesCubit>().addLike(LikeModel(
                  blogID: blog.blogID!,
                  userID: user.id,
                  userName: user.username,
                ));
            context.read<BlogsCubit>().updateBlog(
              blogID: blog.blogID!,
              likes: blog.likes + 1,
            );
          }
        },
        icon: Icon(
          (isLiked) ? Icons.thumb_up : Icons.thumb_up_outlined,
        ),
        // style: ElevatedButton.styleFrom(
        //   // backgroundColor: Color(primaryColorDark),
        //   //primary: blueNavy[300],
        //   //fixedSize: const Size(200, 200),
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        // ),
      );
    });
  }
}
