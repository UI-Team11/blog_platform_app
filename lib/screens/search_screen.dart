import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  get icon => null;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          if (icon == Icons.search) {
            var customIcon = const Icon(Icons.cancel);
            var customSearchBar = const ListTile(
              leading: Icon(
                Icons.search,
                color: Colors.white,
                size: 28,
              ),
              title: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Here.',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          }
        });
      },
      icon: const Icon(Icons.search),
    );
  }
}
