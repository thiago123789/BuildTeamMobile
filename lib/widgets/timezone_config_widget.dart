import 'package:build_gsd_team/models/enums.dart';
import 'package:build_gsd_team/models/team.dart';
import 'package:flutter/material.dart';

class TimeZoneConfigWidget extends StatefulWidget {
  final Team _team;

  TimeZoneConfigWidget(this._team);
  @override
  _TimeZoneConfigWidgetState createState() => _TimeZoneConfigWidgetState(_team);
}

class _TimeZoneConfigWidgetState extends State<TimeZoneConfigWidget> {
  Team _team;

  TimeZoneConfigEnum _timeZoneConfig = TimeZoneConfigEnum.OffShore;

  _TimeZoneConfigWidgetState(this._team);

  @override
  Widget build(BuildContext context) {
    _timeZoneConfig = _team.timeZoneConfig;

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
                "Timezone type",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            contentPadding: EdgeInsets.only(left: 7, bottom: 0, top: 0),
            title: Align(
              child: Text("Near shore"),
              alignment: Alignment(-1.2, 0),
            ),
            leading: Radio(
                value: TimeZoneConfigEnum.NearShore,
                groupValue: _timeZoneConfig,
                onChanged: (TimeZoneConfigEnum value) {
                  setState(() {
                    _team.timeZoneConfig = value;
                    _timeZoneConfig = value;
                  });
                }),
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            contentPadding: EdgeInsets.only(left: 7, bottom: 0, top: 0),
            title: Align(
              child: Text("Off shore"),
              alignment: Alignment(-1.2, 0),
            ),
            leading: Radio(
                value: TimeZoneConfigEnum.OffShore,
                groupValue: _timeZoneConfig,
                onChanged: (TimeZoneConfigEnum value) {
                  setState(() {
                    _team.timeZoneConfig = value;
                    _timeZoneConfig = value;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
