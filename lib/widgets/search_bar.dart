import 'package:blog_platform_app/screens/search_screen.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight * 0.6,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Row(
        children: [
          //TODO: Fix bug that hides text after filling the text field
          Expanded(
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) => _text = value,
              textInputAction: TextInputAction.search,
              onFieldSubmitted: (_) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(filterValue: _text),
                  ),
                );
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: kToolbarHeight * 0.3,
                  horizontal: 10,
                ),
              ),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 28,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(7))),
    );
  }
}
