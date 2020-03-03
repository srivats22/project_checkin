import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpaceInvaders extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SpaceInvadersState();
  }
}

class _SpaceInvadersState extends State<SpaceInvaders>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body:  Padding(
           padding: EdgeInsets.only(left: 50, right: 50),
           child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection("Space Invaders")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return new CircularProgressIndicator();
                    default:
                      return new ListView(
                        physics: BouncingScrollPhysics(),
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          return new GestureDetector(
                            onTap: () {
                              document.reference.updateData({
                                'attendence': document['attendence'] + 1
                              });
                            },
                            child: Card(
                              child: ListTile(
                                leading: Icon(Icons.account_circle),
                                title: Text(document['name']),
                                subtitle: Text('Attendence: ' + document['attendence'].toString()),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                  }
                },
              ),
         )
      ),
    );
  }
}