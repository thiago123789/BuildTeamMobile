import 'package:build_gsd_team/widgets/login_widget.dart';
import 'package:flutter/material.dart';

class EmailSelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(89, 74, 126, 227),
        body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20.0),
              child: LoginWidget()),
        ));
  }
}
