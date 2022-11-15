import 'package:blog_platform_app/bloc/blogs_cubit.dart';
import 'package:blog_platform_app/models/blog_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/bottom_loader_indicator.dart';

class CreateBlogScreen extends StatefulWidget {
  const CreateBlogScreen({Key? key}) : super(key: key);

  @override
  State<CreateBlogScreen> createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogsCubit, BlogsState>(builder: (context, currState) {
      if (currState is BlogsLoadedState) {
        return Form(
          key: _fromKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              Title(
                  color: Colors.white,
                  child: Text("Create A Blog Form",
                      style: TextStyle(color: Colors.white))),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Author'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Text for Blog'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Source Cited'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print('Button pressed ...');
                },
                child: const Text('Import Photo'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print('Button pressed ...');
                  // TODO: Replace hard coded values with variables
                  context.read<BlogsCubit>().saveBlog(BlogModel(
                        creatorID: FirebaseAuth.instance.currentUser?.uid ?? "",
                        title: "Test Title 2",
                        content: "Test Content 2",
                        imageUrl: "Test Image Url",
                        likes: 10,
                        views: 10,
                        publishedDateUnix: 2130120,
                        modifiedDateUnix: 2130120,
                        status: BlogStatus.active,
                        tags: {"Technology 2", "Science 2"},
                      ));
                },
                child: const Text('Create Blog'),
              ),
            ],
          ),
        );
      }
      if (currState is BlogsLoadingState) {
        return const LoaderIndicator();
      }

      return const Center(child: Text("Error"));
    });
  }
}
