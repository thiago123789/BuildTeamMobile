import 'package:build_gsd_team/async_widget/list_teams_widget.dart';
import 'package:build_gsd_team/screens/create_team_select_client_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenSemSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "My teams",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(child: ListTeamsWidget())
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text("Build team"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateTeamSelectClientScreen()));
        },
      ),
    );
  }
}
