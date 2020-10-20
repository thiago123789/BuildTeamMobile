import 'package:build_gsd_team/models/enums.dart';
import 'package:build_gsd_team/models/team.dart';
import 'package:flutter/material.dart';

class LocationReferenceWidget extends StatefulWidget {
  final Team _team;

  LocationReferenceWidget(this._team);

  @override
  _LocationReferenceWidgetState createState() =>
      _LocationReferenceWidgetState(_team);
}

class _LocationReferenceWidgetState extends State<LocationReferenceWidget> {
  Team _team;
  LocationReferenceEnum _locationReference =
      LocationReferenceEnum.ClientLocation;
  bool _enabled = false;

  _LocationReferenceWidgetState(this._team);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _locationReference = _team.locationReferenceEnum;

    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 24, bottom: 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Location Reference",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        ListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.only(left: 7, bottom: 0, top: 0),
          title: Align(
            child: Text("Client Location"),
            alignment: Alignment(-1.2, 0),
          ),
          leading: Radio(
              value: LocationReferenceEnum.ClientLocation,
              groupValue: _locationReference,
              onChanged: (LocationReferenceEnum value) {
                setState(() {
                  controller.clear();
                  _enabled = false;
                  _team.locationReferenceEnum = value;
                  _locationReference = value;
                });
              }),
        ),
        ListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.only(left: 7, bottom: 0, top: 0),
          title: Align(
            child: Text("Office Location"),
            alignment: Alignment(-1.2, 0),
          ),
          leading: Radio(
              value: LocationReferenceEnum.OfficeLocation,
              groupValue: _locationReference,
              onChanged: (LocationReferenceEnum value) {
                setState(() {
                  controller.clear();
                  _enabled = false;
                  _team.locationReferenceEnum = value;
                  _locationReference = value;
                });
              }),
        ),
        ListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.only(left: 7, bottom: 0, top: 0),
          title: Align(
            child: Text("Other Location"),
            alignment: Alignment(-1.2, 0),
          ),
          leading: Radio(
              value: LocationReferenceEnum.OtherLocation,
              groupValue: _locationReference,
              onChanged: (LocationReferenceEnum value) {
                setState(() {
                  controller.clear();
                  _enabled = true;
                  _team.locationReferenceEnum = value;
                  _locationReference = value;
                });
              }),
        ),
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: TextField(
            enabled: _enabled,
            onChanged: (value) {
              _team.customLocation = value;
            },
            controller: controller,
            obscureText: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Custom Location (City name)',
            ),
          ),
        )
      ],
    ));
  }
}
