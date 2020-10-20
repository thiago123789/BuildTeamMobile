import 'package:build_gsd_team/models/client.dart';
import 'package:build_gsd_team/models/enums.dart';
import 'package:build_gsd_team/models/team.dart';
import 'package:build_gsd_team/screens/create_team_select_client_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeamService {
  //TODO: precisa melhor esse método para usar algum tipo de nested future.
  Future<List<Team>> GetTeams() async {
    CollectionReference clients =
        FirebaseFirestore.instance.collection('clients');

    var teamValues = await GetAllTeams();

    teamValues.map((e) {
      clients
          .doc(e.clientId)
          .get()
          .then((value) => e.client = Client.fromJson(value.data(), value.id));
    });

    var teamWidgets = teamValues.map((e) {});

    return teamValues;
  }

  Future<Iterable<Team>> GetAllTeams() {
    CollectionReference teams = FirebaseFirestore.instance.collection('teams');

    return teams.get().then(
        (value) => value.docs.map((e) => Team.fromJson(e.data(), null, e.id)));
  }

  Future<void> AddTeam(BuildContext context, Team team) {
    CollectionReference teams = FirebaseFirestore.instance.collection('teams');

    return teams.add({
      'clientId': team.client.id,
      'locationReference': team.locationReferenceEnum.toFormattedString(),
      'teamType': team.teamType.toFormattedString(),
      'timezoneConfig': team.timeZoneConfig.toFormattedString(),
      'customLocation': team.customLocation,
      'maxCountries': team.maxCountries.toString(),
      'maxTeamSize': team.maxTeamSize.toString(),
    }).then((value) async {
      await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text("Message"),
              content: Text("Team successfully created"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () => {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CreateTeamSelectClientScreen()),
                        (Route<dynamic> route) => false)
                  },
                )
              ],
            );
          });
    }).catchError((error) => print("Error"));
  }
}
