import 'package:build_gsd_team/models/client.dart';
import 'package:build_gsd_team/screens/create_team_basic_config_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ListClientsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference clients =
        FirebaseFirestore.instance.collection("clients");

    return FutureBuilder<QuerySnapshot>(
      future: clients.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
            itemCount: snapshot.data.docs.length,
            separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(top: 2, bottom: 2),
                ),
            itemBuilder: (context, index) {
              var client = Client.fromJson(
                  snapshot.data.docs.elementAt(index).data(),
                  snapshot.data.docs.elementAt(index).id);
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CreateTeamBaseConfigScreen(client),
                      ));
                },
                child: Card(
                  child: new ListTile(
                    leading: FadeInImage.memoryNetwork(
                        width: 80,
                        placeholder: kTransparentImage,
                        image: client.logo),
                    title: Text(client.name),
                    subtitle: Text(client.country + '\n' + client.marketType),
                    isThreeLine: true,
                  ),
                ),
              );
            });
      },
    );
  }
}
