import 'package:build_gsd_team/models/primitive_wrapper.dart';
import 'package:build_gsd_team/models/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtherSettingsSelectionWidget extends StatefulWidget {
  final Team _team;

  OtherSettingsSelectionWidget(this._team);

  @override
  _OtherSettingsSelectionWidgetState createState() =>
      _OtherSettingsSelectionWidgetState(_team);
}

class _OtherSettingsSelectionWidgetState
    extends State<OtherSettingsSelectionWidget> {
  Team _team;

  _OtherSettingsSelectionWidgetState(this._team);

  TextEditingController maxSizeController;
  TextEditingController maxCountriesController;

  @override
  void initState() {
    super.initState();
    maxSizeController = TextEditingController(text: '0');
    maxCountriesController = TextEditingController(text: '0');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, right: 5),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, bottom: 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Other Settings",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: TextField(
              obscureText: false,
              controller: maxSizeController,
              onChanged: (value) {
                if (value != '') {
                  _team.maxTeamSize = new Integer.int(int.parse(value));
                } else {
                  _team.maxTeamSize = new Integer.int(0);
                }
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Max people on GSD team',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: TextField(
              controller: maxCountriesController,
              obscureText: false,
              onChanged: (value) async {
                if (value != '') {
                  _team.maxCountries = new Integer.int(int.parse(value));
                } else {
                  _team.maxCountries = new Integer.int(0);
                }
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Max countries to use',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
