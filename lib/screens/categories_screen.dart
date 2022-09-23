import 'package:flutter/material.dart';
import '../custom_theme.dart';
import '../lib/flutter_flow/flutter_flow_theme.dart';
import '../lib/flutter_flow/flutter_flow_widgets.dart';
import '../widgets/category_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: GridView.builder(
        itemCount: 15,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 100,
          crossAxisSpacing: 100,
          maxCrossAxisExtent: maxCategoryCardSize,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.height / 6,
            child: ElevatedButton(
              onPressed: () {},
              child: const Center(
                child: Text("Sign In"),
              ),
              style: ElevatedButton.styleFrom(
                //primary: blueNavy[300],
                //fixedSize: const Size(200, 200),
                shape: const RoundedRectangleBorder(),
              ),
            ),
          );
        },
      ),
    );
    return Container();
  }
}
