import 'package:blog_platform_app/bloc/auth_cubit.dart';
import 'package:blog_platform_app/bloc/subscriptions_cubit.dart';
import 'package:blog_platform_app/custom_theme.dart';
import 'package:blog_platform_app/widgets/bottom_loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:blog_platform_app/models/blog_model.dart';

import '../models/subscription_model.dart';
import '../models/user_model.dart';
import '../widgets/subscription_button.dart';
/*
 * This widget is the page for previewing an article. It shows the image,
 * title, source, published date, and summary of the article. It also has
 * a button to read the full article in the source page. (shows the url of
 * the article)
 */

class BlogViewScreen extends StatelessWidget {
  final BlogModel blog;

  const BlogViewScreen({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(backgroundColor),
      appBar: AppBar(),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, authCurrState) {
          return FutureBuilder(
            future: context.read<AuthCubit>().getUser(blog.creatorID),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                UserModel? publisher = snapshot.data as UserModel?;

                if (snapshot.hasError || publisher == null) {
                  return const Center(
                    child: Text("Error while getting publisher data"),
                  );
                }

                //TODO: Rework this into another class or widget
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2,
                    ),
                    child: ListView(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        Center(
                          child: Text(blog.title,
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        const SizedBox(height: 20),
                        //TODO: Replace hard coded url with the one of the blog
                        Image.network(
                          "https://c0.wallpaperflare.com/preview/639/306/330/aerial-background-blog-cafe.jpg",
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.width * 0.4,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            SizedBox(
                              height: kToolbarHeight / 1.3,
                              width: kToolbarHeight / 1.3,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Center(
                                  child: Text("J"),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(secondaryColorDark),

                                  //fixedSize: const Size(200, 200),
                                  shape: const CircleBorder(),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              publisher.username,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Expanded(child: SizedBox(width: 5)),
                            (authCurrState is AuthSignedInState)
                                ? SubscriptionButton(
                                    publisher: publisher,
                                    user: authCurrState.user!,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          blog.publishedDate,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 50),
                        Expanded(
                          child: Text(
                            blog.content,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(height: 1.4),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return LoaderIndicator();
              }
            },
          );
        },
      ),
    );
  }
}
