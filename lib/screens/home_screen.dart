import 'package:build_gsd_team/services/team_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TeamService service = TeamService();
    CollectionReference teams = FirebaseFirestore.instance.collection('teams');

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              automaticallyImplyLeading: false,
              title: GsdHomeAppBar(),
              expandedHeight: 210.0,
              pinned: true,
              flexibleSpace:
                  FlexibleSpaceBar(background: GsdHomeFlexibleSpaceBar())),
          SliverList(
              delegate: SliverChildListDelegate([
            FutureBuilder<QuerySnapshot>(
              future: teams.get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  final snackBar =
                      SnackBar(content: Text("Error to get clients"));
                  Scaffold.of(context).showSnackBar(snackBar);
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  var map = snapshot.data.docs.map((e) => {TeamCard()});
                }

                return Text("");
              },
            )
          ])),
        ],
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Team name'),
              subtitle: Text(
                  'Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sapien augue, faucibus nec ligula vitae, fringilla tincidunt tellus. Sed ullamcorper urna nisl, vel rhoncus metus bibendum id. Vestibulum consectetur turpis.'),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Allocate'),
                  onPressed: () {/* ... */},
                ),
                FlatButton(
                  child: const Text('Edit'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GsdHomeFlexibleSpaceBar extends StatelessWidget {
  final double appBarHeight = 66.0;

  const GsdHomeFlexibleSpaceBar();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
        padding: new EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + appBarHeight,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'Teams Overview',
                        style: TextStyle(color: Colors.white, fontSize: 28.0),
                      ),
                    ),
                    Container(
                      child: Text(
                        '35 active teams',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 36.0),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          '5 warnnigs',
                          style:
                              TextStyle(color: Colors.orange, fontSize: 20.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 8.0, left: 8.0),
                        child: Text(
                          'My Teams',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 16.0),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.calendarAlt,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: Text(
                                  'Sep 2020',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white70,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        decoration: new BoxDecoration(
          color: Color(0xff013db7),
        ));
  }
}

class GsdHomeAppBar extends StatelessWidget {
  final double barHeight = 66.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, top: 16.0, right: 16.0, bottom: 16.0),
              child: Icon(
                FontAwesomeIcons.bars,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Home',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 16.0, right: 5.0, bottom: 16.0),
              child: Icon(
                FontAwesomeIcons.cog,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
