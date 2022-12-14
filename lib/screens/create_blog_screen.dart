import 'package:blog_platform_app/bloc/blogs_cubit.dart';
import 'package:blog_platform_app/custom_theme.dart';
import 'package:blog_platform_app/models/blog_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import '../widgets/bottom_loader_indicator.dart';
import 'package:custom_form_field/custom_form_field.dart';

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
  String _imageURL = "";
  String _sources = "";
  Set<String> _categories = {};
  CustomFormField customFormField = CustomFormField();
  final formKey = new GlobalKey<FormState>();

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
          imageUrl: _imageURL,
          likes: 0,
          views: 0,
          publishedDateUnix: DateTime.now().millisecondsSinceEpoch,
          modifiedDateUnix: DateTime.now().millisecondsSinceEpoch,
          status: BlogStatus.active,
          tags: _categories,
        ));
  }

  Widget build(BuildContext context) {
    return BlocBuilder<BlogsCubit, BlogsState>(builder: (context, currState) {
      if (currState is BlogsLoadedState) {
        return Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            children: <Widget>[
              const SizedBox(height: 20),
              Title(
                  color: Colors.white,
                  child: Text("Create A Blog Form",
                      style: TextStyle(color: Colors.black, fontSize: 20))),

              // TextFormField(
              //   onSaved: (value) => _title = value ?? "",
              //   decoration: const InputDecoration(labelText: 'Title'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter some text';
              //     }
              //     return null;
              //   },
              // ),
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

              // TextFormField(
              //   onSaved: (value) {
              //     //TODO: Add multiple values instead of a single value
              //     if(value != null) {
              //       _categories.add(value);
              //     }
              //   },
              //   decoration: const InputDecoration(labelText: 'Category'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter some text';
              //     }
              //     return null;
              //   },
              // ),
              const SizedBox(height: 20),
              Text(" Title"),
              const SizedBox(height: 5),
              customFormField.field(
                verticalTextPadding: 20,
                question: "",
                canBeNull: false,
                formKey: formKey,
                onSavedCallback: (String val) => _title = val,
                borderRadius: 10,
              ),
              const SizedBox(
                height: 20,
                // child: const DecoratedBox(
                //     decoration: const BoxDecoration(color: Colors.blueGrey)),
              ),
              Text(" Image URL"),
              const SizedBox(height: 5),
              customFormField.field(
                verticalTextPadding: 20,
                question: "",
                canBeNull: false,
                formKey: formKey,
                onSavedCallback: (String val) => _imageURL = val,
                borderRadius: 10,
              ),
              const SizedBox(
                height: 20,
                // child: const DecoratedBox(
                //     decoration: const BoxDecoration(color: Colors.blueGrey)),
              ),
              Text(" Categories"),
              const SizedBox(height: 5),
              MultiSelectFormField(

                autovalidate: AutovalidateMode.disabled,
                chipBackGroundColor: Colors.blue,
                chipLabelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                checkBoxActiveColor: Colors.blue,
                checkBoxCheckColor: Colors.white,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                dialogShapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                title: Text(
                  "",
                  style: TextStyle(fontSize: 16),
                ),
                validator: (value) {
                  if (value == null || value.length == 0) {
                    return 'Please select one or more options';
                  }
                  return null;
                },
                dataSource: [
                  {
                    "display": "Medicine",
                    "value": "Medicine",
                  },
                  {
                    "display": "Science",
                    "value": "Science",
                  },
                  {
                    "display": "Technology",
                    "value": "Technology",
                  },
                  {
                    "display": "Business",
                    "value": "Business",
                  },
                  {
                    "display": "Space",
                    "value": "Space",
                  },
                  {
                    "display": "Food",
                    "value": "Food",
                  },
                  {
                    "display": "Travel",
                    "value": "Travel",
                  },
                  {
                    "display": "Sports",
                    "value": "Sports",
                  },
                  {
                    "display": "Cars",
                    "value": "Cars",
                  },
                  {
                    "display": "Politics",
                    "value": "Politics",
                  },
                  {
                    "display": "Finance",
                    "value": "Finance",
                  },
                  {
                    "display": "Conspiracy Theory",
                    "value": "Conspiracy Theory",
                  },
                ],
                textField: 'display',
                valueField: 'value',
                okButtonLabel: 'OK',
                cancelButtonLabel: 'CANCEL',
                hintWidget: Text('Please choose one or more'),
                // initialValue: _myCategory,
                onSaved: (value) {
                  if (value == null) return;
                  setState(() {
                    _categories = {};
                    for (var item in value) {
                      _categories.add(item as String);
                    }
                  });
                },
              ),
              const SizedBox(
                height: 20,
                // child: const DecoratedBox(
                //     decoration: const BoxDecoration(color: Colors.blueGrey))
              ),
              Text("Content Body"),
              const SizedBox(height: 5),
              customFormField.field(
                question: "",
                verticalTextPadding: 20,
                canBeNull: false,
                formKey: formKey,
                onSavedCallback: (String val) => _content = val,
                borderRadius: 10,
              ),
              // TextFormField(
              //   onSaved: (value) => _content = value ?? "",
              //   decoration: const InputDecoration(labelText: 'Text for Blog'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter some text';
              //     }
              //     return null;
              //   },
              // ),
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
        return LoaderIndicator(color: Color(primaryColorDark));
      }

      return const Center(child: Text("Error"));
    });
  }
}
