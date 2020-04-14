import 'package:flutter/material.dart';
import 'package:ruroomates/edit_profile.dart';
import 'package:ruroomates/home.dart';
import 'package:ruroomates/questionaire_page.dart';
import 'package:ruroomates/sign_in.dart';
import 'match.dart';


class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(title: new Text("Your Profile"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.teal[700],
                    Colors.teal[200],
                  ]
              )
          ),
        ),
        leading: new IconButton(icon: new Icon(Icons.arrow_back), onPressed: () {
          //try{
          dynamic matches = Match.getMatch();
          List<String> matches2 = Match.update(matches);
          List<int> perc = Match.update2(matches);
          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(matches2, perc)));
          // } catch (Exception) {
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> Error()));
          // }
        }),),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // gradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [Colors.white],
          // ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 40),
              Text(
                'NAME',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              Text(
                email,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(

                    MaterialPageRoute(
                      builder: (context) {
                        return QuestionnairePage();
                      },
                    ),
                  );

                },
                color: Colors.teal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Questionaire',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
              SizedBox(height: 40),

              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return EditProfile();
                      },
                    ),
                  );
                },
                color: Colors.teal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}