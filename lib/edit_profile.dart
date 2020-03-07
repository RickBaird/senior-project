import 'package:flutter/material.dart';
import 'package:ruroomates/first_screen.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
        leading: new IconButton(icon: new Icon(Icons.arrow_back), onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> FirstScreen()));
        }),
        title: Text("Edit Profile"),
        ),
        body: Center(child: Text("Test"),
        ),
      ),
    );
  }
}