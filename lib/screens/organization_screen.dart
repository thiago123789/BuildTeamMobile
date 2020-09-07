import 'package:build_gsd_team/screens/email_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrganizationSelectionScreen extends StatefulWidget {
  @override
  _OrganizationSelectionScreen createState() {
    return _OrganizationSelectionScreen();
  }
}

class _OrganizationSelectionScreen extends State<OrganizationSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
        backgroundColor: Color.fromARGB(89, 74, 126, 227),
        body: Center(
          child: Form(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text("What is your organization ?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        hintText: "Organization name",
                        hintStyle: TextStyle(color: Colors.white30),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        fillColor: Colors.white,
                        focusColor: Colors.white),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 10),
                    child: ButtonBar(
                      buttonPadding: EdgeInsets.all(0),
                      children: <Widget>[
                        Container(
                          child: OutlineButton(
                            borderSide: BorderSide(color: Colors.white),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EmailSelectScreen())),
                            color: Color.fromARGB(89, 71, 188, 253),
                            child: Text('Next',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
