import 'package:flutter/material.dart';
import '../custom_theme.dart';
import '../lib/flutter_flow/flutter_flow_theme.dart';
import '../lib/flutter_flow/flutter_flow_widgets.dart';

class CatergoryScreen extends StatefulWidget {
  const CatergoryScreen({Key? key}) : super(key: key);

  @override
  State<CatergoryScreen> createState() => _CatergoryScreenState();
}

class _CatergoryScreenState extends State<CatergoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),

      child: GridView.builder(

          itemCount: 10,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing: 100,
            crossAxisSpacing: 100,
            maxCrossAxisExtent: 150,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 150,
              height: 100,
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    padding: const EdgeInsets.all(30),
                    color: Colors.teal[100],
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Category',
                      options: FFButtonOptions(
                          width: 200,
                          height: 100,
                          color: Color(0xFF476072),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                        borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      ),
                      //  Text("data"),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
    return Container();
  }
}
