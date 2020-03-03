import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_signin/spaceInvaders.dart';
import 'package:project_signin/webDev.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Check In',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Project Check In', style: GoogleFonts.googleSans(),),
            bottom: TabBar(
              tabs: <Widget>[
                Text('Web Dev Project', style: GoogleFonts.googleSans(),),
                Text('Space Invaders Project', style: GoogleFonts.googleSans(),),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              WebDev(),
              SpaceInvaders()
            ],
          )
        ),
      )
    );
  }
}
