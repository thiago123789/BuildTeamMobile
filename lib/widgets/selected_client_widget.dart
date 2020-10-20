import 'package:build_gsd_team/models/client.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SelectedClientWidget extends StatefulWidget {
  final Client client;

  SelectedClientWidget(this.client);

  @override
  _SelectedClientWidgetState createState() =>
      _SelectedClientWidgetState(client);
}

class _SelectedClientWidgetState extends State<SelectedClientWidget> {
  final Client client;

  _SelectedClientWidgetState(this.client);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, bottom: 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Selected Client",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Card(
            child: new ListTile(
              leading: FadeInImage.memoryNetwork(
                  width: 80,
                  placeholder: kTransparentImage,
                  image: client.logo),
              title: Text(client.name),
              subtitle: Text(client.country + '\n' + client.marketType),
              isThreeLine: true,
            ),
          )
        ],
      ),
    );
  }
}
