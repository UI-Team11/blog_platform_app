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
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _content = "";
  //TODO: Add sources to blogs but not a priority
  String _sources = "";
  Set<String> _categories = {};

  void _submit() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    context.read<BlogsCubit>().saveBlog(BlogModel(
      creatorID: FirebaseAuth.instance.currentUser?.uid ?? "Unknown",
      title: _title,
      content: _content,
      imageUrl: "Test Image Url",
      likes: 0,
      views: 0,
      publishedDateUnix: DateTime.now().millisecondsSinceEpoch,
      modifiedDateUnix: DateTime.now().millisecondsSinceEpoch,
      status: BlogStatus.active,
      tags: _categories,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogsCubit, BlogsState>(builder: (context, currState) {
      if (currState is BlogsLoadedState) {
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              Title(
                  color: Colors.white,
                  child: Text("Create A Blog Form",
                      style: TextStyle(color: Colors.white))),
              TextFormField(
                onSaved: (value) => _title = value ?? "",
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              //TODO: Delete this field, already getting this data from the logged in user
              // TextFormField(
              //   onSaved: (value) => _author = value ?? "",
              //   decoration: const InputDecoration(labelText: 'Author'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter some text';
              //     }
              //     return null;
              //   },
              // ),
              TextFormField(
                onSaved: (value) {
                  //TODO: Add multiple values instead of a single value
                  if(value != null) {
                    _categories.add(value);
                  }
                },
                decoration: const InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                onSaved: (value) => _content = value ?? "",
                decoration: const InputDecoration(labelText: 'Text for Blog'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              //TODO: Ignoring this source cited field for now, but may use it the future
              // TextFormField(
              //   decoration: const InputDecoration(labelText: 'Source Cited'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter some text';
              //     }
              //     return null;
              //   },
              // ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                },
                child: const Text('Import Photo'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print('Button pressed ...');
                  _submit();
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
