import 'package:build_gsd_team/models/team.dart';
import 'package:build_gsd_team/services/team_service.dart';
import 'package:flutter/material.dart';

class CreateTeamConfirmationProgressScreen extends StatelessWidget {
  final Team _team;

  CreateTeamConfirmationProgressScreen(this._team);

  @override
  Widget build(BuildContext context) {
    TeamService teamService = TeamService();

    return Scaffold(
      appBar: AppBar(
        title: Text("Build Team"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  strokeWidth: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Building Team"),
                ),
                FutureBuilder<void>(
                    builder: (BuildContext context, AsyncSnapshot snapshot) =>
                        Text(""),
                    future: teamService.AddTeam(context, _team))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
