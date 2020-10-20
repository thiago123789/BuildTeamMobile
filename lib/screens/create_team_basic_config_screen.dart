import 'package:build_gsd_team/models/client.dart';
import 'package:build_gsd_team/models/enums.dart';
import 'package:build_gsd_team/models/primitive_wrapper.dart';
import 'package:build_gsd_team/models/team.dart';
import 'package:build_gsd_team/screens/review_team_build_screen.dart';
import 'package:build_gsd_team/widgets/location_reference_widget.dart';
import 'package:build_gsd_team/widgets/other_settings_selection_widget.dart';
import 'package:build_gsd_team/widgets/selected_client_widget.dart';
import 'package:build_gsd_team/widgets/team_type_selection_widget.dart';
import 'package:build_gsd_team/widgets/timezone_config_widget.dart';
import 'package:flutter/material.dart';

class CreateTeamBaseConfigScreen extends StatefulWidget {
  final Client _client;

  CreateTeamBaseConfigScreen(this._client);

  @override
  _CreateTeamBaseConfigScreen createState() =>
      _CreateTeamBaseConfigScreen(_client);
}

class _CreateTeamBaseConfigScreen extends State<CreateTeamBaseConfigScreen> {
  final Client _client;
  Team _team;

  _CreateTeamBaseConfigScreen(this._client);

  @override
  Widget build(BuildContext context) {
    if (_team == null) {
      _team = new Team(
          TeamTypeEnum.Squad,
          TimeZoneConfigEnum.OffShore,
          _client,
          new Integer.int(0),
          new Integer.int(0),
          LocationReferenceEnum.ClientLocation);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Build Team"),
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Step 2: Basic Configuration",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
              SelectedClientWidget(_client),
              Container(
                padding: EdgeInsets.all(10),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              TimeZoneConfigWidget(_team),
              Container(
                padding: EdgeInsets.all(10),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              LocationReferenceWidget(_team),
              Container(
                padding: EdgeInsets.all(10),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              TeamTypeSelectionWidget(_team),
              Container(
                padding: EdgeInsets.all(10),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              OtherSettingsSelectionWidget(_team),
              Container(
                padding: EdgeInsets.all(10),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                padding:
                    EdgeInsets.only(top: 10, bottom: 30, left: 15, right: 15),
                child: RaisedButton(
                  child: Text("Review"),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReviewTeamBuildScreen(_team)));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
