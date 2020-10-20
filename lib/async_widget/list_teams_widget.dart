import 'package:build_gsd_team/models/enums.dart';
import 'package:build_gsd_team/models/team.dart';
import 'package:build_gsd_team/screens/detail_team_screen.dart';
import 'package:build_gsd_team/services/team_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListTeamsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference teams = FirebaseFirestore.instance.collection("teams");
    TeamService service = TeamService();

    return FutureBuilder<Iterable<Team>>(
      future: service.GetAllTeams(),
      builder: (BuildContext context, AsyncSnapshot<Iterable<Team>> snapshot) {
        if (snapshot.hasError) {
          final snackBar = SnackBar(content: Text("Error to get clients"));
          Scaffold.of(context).showSnackBar(snackBar);
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return new ListView.separated(
            itemCount: snapshot.requireData.length,
            separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(top: 2, bottom: 2),
                ),
            itemBuilder: (context, index) {
              var team = snapshot.requireData.elementAt(index);
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailTeamScreen(team)));
                },
                child: Card(
                  child: new ListTile(
                    title: Text(team.teamType.toFormattedString()),
                    subtitle: Text(team.timeZoneConfig.toFormattedString() ??
                        "" +
                            '\n' +
                            team.locationReferenceEnum.toFormattedString() ??
                        ""),
                    isThreeLine: true,
                  ),
                ),
              );
            });
      },
    );
  }
}
