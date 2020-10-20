import 'package:build_gsd_team/models/team.dart';
import 'package:build_gsd_team/widgets/selected_client_widget.dart';
import 'package:build_gsd_team/widgets/team_detail_widget.dart';
import 'package:flutter/material.dart';

class DetailTeamScreen extends StatelessWidget {
  final Team _team;

  DetailTeamScreen(this._team);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Build Team - Review"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Team Details",
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (_team.client != null) SelectedClientWidget(_team.client),
            TeamDetailWidget(_team)
          ],
        ),
      ),
    );
  }
}
