import 'package:flutter/material.dart';
import '../custom_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: GridView.builder(
          itemCount: 50,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing: 100,
            crossAxisSpacing: 100,
            maxCrossAxisExtent: 150,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 150,
              height: 100,
              child: Column(children: [
              Container(
                width: 150,
                height: 100,
                padding: const EdgeInsets.all(30),
                color: Colors.teal[100],
                child: const Text("Image"),
              ),
              Text("data"),
            ]
              ),
              );
          }),
    );
    return Container();
  }
}
