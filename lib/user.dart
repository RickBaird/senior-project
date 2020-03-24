import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ruroomates/home.dart';
import 'package:ruroomates/Chat.dart';
import 'package:ruroomates/const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'const.dart';

class UserProfile extends StatelessWidget {
  String currentUserId;
  DocumentSnapshot document;
  final String peerID;
  final String peerPic;
  final String peerAboutMe;
  final String insta;
  final String twitter;

  UserProfile(
      {Key key,
      @required this.peerID,
      @required this.peerPic,
      @required this.peerAboutMe,
      @required this.insta,
      @required this.twitter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: WillPopScope(
        child: new OtherUserProfile(
                peerID: peerID,
                peerPic: peerPic,
                peerAboutMe: peerAboutMe,
                insta: insta,
                twitter: twitter) ??
            new Container(
              width: 0.0,
              height: 0.0,
            ),
      ),
    );
  }
}

class OtherUserProfile extends StatefulWidget {
  final String title;
  DocumentSnapshot document;
  String peerID;
  String peerPic;
  String peerAboutMe;
  String insta;
  String twitter;

  OtherUserProfile(
      {Key key,
      this.title,
      @required this.peerID,
      @required this.peerPic,
      @required this.peerAboutMe,
      @required this.insta,
      @required this.twitter})
      : super(key: key);

  @override
  _OtherUserProfileState createState() => _OtherUserProfileState(
      peerID: peerID,
      peerPic: peerPic,
      peerAboutMe: peerAboutMe,
      insta: insta,
      twitter: twitter);
}

class _OtherUserProfileState extends State<OtherUserProfile> {
  _OtherUserProfileState(
      {Key key,
      @required this.peerID,
      @required this.peerPic,
      @required this.peerAboutMe,
      @required this.insta,
      @required this.twitter});

  SharedPreferences prefs;
  String groupChatId;
  DocumentSnapshot document = Firestore.instance.collection('messages').document(groupChatId).collection(groupChatId).toString();
  String profileViewID;
  String peerID;
  String peerPic;
  String peerAboutMe;
  String insta;
  String twitter;
  String id;
  String currentUserId;

  Future<bool> onBackPress() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => new HomePage()));
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.brown,
                    Colors.yellow,
                  ])),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Material(
                        child: /* document['photoUrl'] != null ? */ CachedNetworkImage(
                          placeholder: (context, url) =>
                              Container(
                                child: CircularProgressIndicator(
                                  strokeWidth: 1.0,
                                  valueColor:
                                  AlwaysStoppedAnimation<Color>(themeColor),
                                ),
                                width: 40.0,
                                height: 40.0,
                                padding: EdgeInsets.all(15.0),
                              ),
                          imageUrl: peerPic,
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        clipBehavior: Clip.hardEdge,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return DetailScreen(peerPic: peerPic);
                        }));
                      },
                    ),
                  ]),
              Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      peerID,
                      //'${document['nickname']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
              ]),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'About Me: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(1.0),
                      child: Text(
                        peerAboutMe ?? 'Not available',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Flexible(
                child: SizedBox(
                  height: 80.0,
                ),
              ),
              Flexible(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 60.0,
                        width: 60.0,
                        padding: EdgeInsets.all(5.0),
                        child: RaisedButton(
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Icon(
                                  Icons.message,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Chat(
                                          peerId: '${document['id']}',
                                          //peerId: '${document.documentID}',
                                          peerAvatar: document['photoUrl'],
                                        )));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 50.0,
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                          width: 30.0,
                          height: 30.0,
                          child: Material(
                            child: InkWell(
                              onTap: _launchInsta,
                              child: Image(
                                image: AssetImage('assets/insta_icon.png'),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        insta ?? 'Not available',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                          width: 30.0,
                          height: 30.0,
                          child: Material(
                            child: InkWell(
                              onTap: _launchTwitter,
                              child: Image(
                                image: AssetImage('assets/twitter_logo.png'),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        twitter ?? 'Not available',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      onWillPop: onBackPress,
    );
  }

  Widget buildItem(BuildContext context, DocumentSnapshot document) {
    if (document['id'] == currentUserId) {
      return Container();
    }
  }


  Future<void> _launchInsta() async {
    var url = 'https://instagram.com/' + insta + '/';
    // Check to see if it's the default null, do nothing
    if (insta == 'Not available') {
      return;
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not be launched $url';
    }
  }

  Future<void> _launchTwitter() async {
    var url = 'https://twitter.com/' + twitter;
    // Check to see if it's the default null, do nothing
    if (twitter == 'Not available') {
      return;
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not be launched $url';
    }
  }

}

class DetailScreen extends StatelessWidget {
  final String peerPic;

  DetailScreen({Key key, @required this.peerPic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: GestureDetector(
          child: Hero(
            tag: 'profile picture',
            child: Container(
              alignment: Alignment.center,
              child: Material(
                child: CachedNetworkImage(
                  placeholder: (context, url) => Container(
                    child: CircularProgressIndicator(
                      strokeWidth: 1.0,
                      valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                    ),
                    width: 40.0,
                    height: 40.0,
                    padding: EdgeInsets.all(15.0),
                  ),
                  imageUrl: peerPic,
                  width: 350.0,
                  height: 350.0,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                clipBehavior: Clip.hardEdge,
              ),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ));
  }
}

// might need this?
class Profile {
  const Profile({this.title, this.icon});

  final String title;
  final IconData icon;
}
