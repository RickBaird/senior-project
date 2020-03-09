import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ruroomates/home.dart';
import 'package:ruroomates/Chat.dart';
import 'package:ruroomates/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'const.dart';

class UserProfile extends StatelessWidget{

  final String peerID;
  final String peerPic;

  UserProfile({Key key, @required this.peerID, @required this.peerPic}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Profile',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: new OtherUserProfile(
          peerID: peerID,
          peerPic: peerPic) ?? new Container(
        width: 0.0,
        height: 0.0,
      ),
    );
  }
}

class OtherUserProfile extends StatefulWidget{

  final String title;
  String peerID;
  String peerPic;

  OtherUserProfile({Key key, this.title, @required this.peerID, @required this.peerPic}) : super(key: key);

  @override
  _OtherUserProfileState createState() => _OtherUserProfileState(peerID: peerID, peerPic: peerPic);
}


class _OtherUserProfileState extends State<OtherUserProfile> {

  _OtherUserProfileState({Key key, @required this.peerID, @required this.peerPic});

  DocumentSnapshot document;
  SharedPreferences prefs;
  String profileViewID;
  String peerID;
  String peerPic;
  String id;


  @override
  Widget build(BuildContext context) {
        return
        SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.brown,
                    Colors.yellow,
                  ]
              )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Material(
                  child:  /* document['photoUrl'] != null ? */  CachedNetworkImage(
                    placeholder: (context, url) => Container(
                          child: CircularProgressIndicator(
                            strokeWidth: 1.0,
                            valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                          ),
                          width: 30.0,
                          height: 30.0,
                          padding: EdgeInsets.all(15.0),
                        ),
                    imageUrl: peerPic,
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  clipBehavior: Clip.hardEdge,
                ),
                 Row(
                   mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          child: Text(
                            peerID,
                            //'${document['nickname']}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ]
                )
              ],
            )
          ],
        ),
        ),
        );
    }


}

// might need this?
class Profile {
  const Profile({this.title, this.icon});

  final String title;
  final IconData icon;
}