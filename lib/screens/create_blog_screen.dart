import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateBlogScreen extends StatefulWidget {
  const CreateBlogScreen({Key? key}) : super(key: key);

  @override
  State<CreateBlogScreen> createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromKey,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Title(
              color: Colors.white,
              child: Text("Create A Blog Form", style: TextStyle(color: Colors.white))),
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Ttile'
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Author'
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Text for Blog'
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Source Cited'
            ),
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
            },
            child: const Text('Create Blog'),
          ),
        ],
      ),
    );
  }
}
