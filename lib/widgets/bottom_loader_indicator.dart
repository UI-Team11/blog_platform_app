import 'package:flutter/material.dart';

/*
 * This widget is the loading indicator shown when loading more news into the
 * list of news.
 */

class LoaderIndicator extends StatelessWidget {
  final Color? color;

  const LoaderIndicator({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        alignment: Alignment.center,
        child: Center(
          child: SizedBox(
            width: 33,
            height: 33,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              color: color ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}