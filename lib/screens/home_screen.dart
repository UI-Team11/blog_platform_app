import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: GridView.builder(
        itemCount: 100,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          maxCrossAxisExtent: 200,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListView.builder(itemBuilder: (context, index){ return Container()}),
              Container(
                width: 150,
                height: 150,
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.red
                    ),
                    Text("Title"),
                    Text("rating: 120"),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
