import 'package:build_gsd_team/models/enums.dart';
import 'package:build_gsd_team/models/team.dart';
import 'package:flutter/material.dart';

class TeamDetailWidget extends StatelessWidget {
  final Team _team;

  TeamDetailWidget(this._team);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 0, top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Team Details",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          LabelValueWidget(
              "Timezone Config", _team.timeZoneConfig.toFormattedString()),
          LabelValueWidget("Location Reference",
              _team.locationReferenceEnum.toFormattedString()),
          if (_team.locationReferenceEnum ==
              LocationReferenceEnum.OtherLocation)
            LabelValueWidget("Custom Location", _team.customLocation),
          LabelValueWidget("Team Type", _team.teamType.toFormattedString()),
          LabelValueWidget("Max Team Size", _team.maxTeamSize.toString()),
          LabelValueWidget("Max Contries", _team.maxCountries.toString())
        ],
      ),
    );
  }
}

class LabelValueWidget extends StatelessWidget {
  final String label;
  final String value;

  LabelValueWidget(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              label + ":",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
