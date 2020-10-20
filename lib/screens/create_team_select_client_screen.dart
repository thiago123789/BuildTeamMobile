import 'package:build_gsd_team/widgets/list_client_widget.dart';
import 'package:flutter/material.dart';

class CreateTeamSelectClientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Build Team"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Step 1: Select Client",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(child: ListClientWidget())
        ],
      ),
    );
  }
}
