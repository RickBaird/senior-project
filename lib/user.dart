
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ruroomates/Chat.dart';
import 'package:ruroomates/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'const.dart';

class UserProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'User Profile Prototype',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: OtherUserProfile(title: 'Other User Profile Prototype'),
    );
  }
}

class OtherUserProfile extends StatefulWidget{
  OtherUserProfile({Key key, this.title}) : super(key: key);
  final String title;
  String peerID;
  String peerPic;

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

readLocal() async {
  prefs = await SharedPreferences.getInstance();
  id = prefs.getString('id') ?? '';
  if (id.hashCode <= peerID.hashCode) {
    profileViewID = '$id-$peerID';
  } else {
    profileViewID= '$peerID-$id';
  }

  Firestore.instance.collection('users').document(id).updateData({'Viewing': peerID});

  setState(() {});
}

  @override
  Widget build(BuildContext context) {
  DocumentSnapshot document;
  if (document['peerID'] == id) {
    return
      Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Material(
                child: document['photoUrl'] != null ? CachedNetworkImage(
                  placeholder: (context, url) =>
                      Container(
                        child: CircularProgressIndicator(
                          strokeWidth: 1.0,
                          valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                        ),
                        width: 50.0,
                        height: 50.0,
                        padding: EdgeInsets.all(15.0),
                      ),
                  imageUrl: document['photoUrl'],
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                )
                    : Icon(
                  Icons.account_circle,
                  size: 50.0,
                  color: greyColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                clipBehavior: Clip.hardEdge,
              ),
              Row(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        child: Text(
                          'Name: ${document['nickname']}',
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ),
                  ]
              )
            ],
          )
        ],
      );
  }
  }

}

// might need this?
class Profile {
  const Profile({this.title, this.icon});

  final String title;
  final IconData icon;
}
