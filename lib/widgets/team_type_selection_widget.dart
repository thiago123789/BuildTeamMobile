import 'package:build_gsd_team/models/enums.dart';
import 'package:build_gsd_team/models/team.dart';
import 'package:flutter/material.dart';

class TeamTypeSelectionWidget extends StatefulWidget {
  final Team _team;

  TeamTypeSelectionWidget(this._team);

  @override
  _TeamTypeSelectionWidgetState createState() =>
      _TeamTypeSelectionWidgetState(_team);
}

class _TeamTypeSelectionWidgetState extends State<TeamTypeSelectionWidget> {
  TeamTypeEnum _teamType = TeamTypeEnum.Squad;

  Team _team;

  _TeamTypeSelectionWidgetState(this._team);

  setTeamType(TeamTypeEnum teamTypeEnum) {
    setState(() {
      _team.teamType = teamTypeEnum;
      _teamType = teamTypeEnum;
    });
  }

  @override
  Widget build(BuildContext context) {
    _teamType = _team.teamType;

    return Container(
      padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, bottom: 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Team Type",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            contentPadding: EdgeInsets.only(left: 7, bottom: 0, top: 0),
            title: Align(
              child: Text("Squad"),
              alignment: Alignment(-1.15, 0),
            ),
            leading: Radio(
                value: TeamTypeEnum.Squad,
                groupValue: _teamType,
                onChanged: setTeamType),
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            contentPadding: EdgeInsets.only(left: 7, bottom: 0, top: 0),
            title: Align(
              child: Text("Safe"),
              alignment: Alignment(-1.15, 0),
            ),
            leading: Radio(
                value: TeamTypeEnum.Safe,
                groupValue: _teamType,
                onChanged: setTeamType),
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            contentPadding: EdgeInsets.only(left: 7, bottom: 0, top: 0),
            title: Align(
              child: Text("AGSD"),
              alignment: Alignment(-1.15, 0),
            ),
            leading: Radio(
                value: TeamTypeEnum.AGSD,
                groupValue: _teamType,
                onChanged: setTeamType),
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            contentPadding: EdgeInsets.only(left: 7, bottom: 0, top: 0),
            title: Align(
              child: Text("DAD"),
              alignment: Alignment(-1.15, 0),
            ),
            leading: Radio(
                value: TeamTypeEnum.DAD,
                groupValue: _teamType,
                onChanged: setTeamType),
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            contentPadding: EdgeInsets.only(left: 7, bottom: 0, top: 0),
            title: Align(
              child: Text("NEXUS"),
              alignment: Alignment(-1.15, 0),
            ),
            leading: Radio(
                value: TeamTypeEnum.Nexus,
                groupValue: _teamType,
                onChanged: setTeamType),
          ),
        ],
      ),
    );
  }
}
