import 'package:build_gsd_team/models/team.dart';
import 'package:build_gsd_team/screens/create_team_confirmation_progress_screen.dart';
import 'package:build_gsd_team/widgets/selected_client_widget.dart';
import 'package:build_gsd_team/widgets/team_detail_widget.dart';
import 'package:flutter/material.dart';

class ReviewTeamBuildScreen extends StatefulWidget {
  final Team _team;

  ReviewTeamBuildScreen(this._team);

  @override
  _ReviewTeamBuildScreenState createState() =>
      _ReviewTeamBuildScreenState(_team);
}

class _ReviewTeamBuildScreenState extends State<ReviewTeamBuildScreen> {
  Team _team;

  _ReviewTeamBuildScreenState(this._team);

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
                  "Step 3: Review Team Config",
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SelectedClientWidget(_team.client),
            TeamDetailWidget(_team),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              padding:
                  EdgeInsets.only(top: 10, bottom: 30, left: 15, right: 15),
              child: RaisedButton(
                child: Text("Confirm"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CreateTeamConfirmationProgressScreen(_team)));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
