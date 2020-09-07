import 'package:build_gsd_team/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailFormat = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text("Credentials",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          TextFormField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            validator: (value) {
              if (value.isEmpty) {
                return "Email is mandatory";
              }
              if (value.isNotEmpty && !emailFormat.hasMatch(value)) {
                return "Email has invalid format";
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.white30),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                fillColor: Colors.white,
                focusColor: Colors.white),
          ),
          SizedBox(height: 10),
          TextFormField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            validator: (value) {
              if (value.isEmpty) {
                return "Password is mandatory";
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Password",
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
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }
                    },
                    color: Color.fromARGB(89, 71, 188, 253),
                    child: Text('Login',
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
    );
  }
}
