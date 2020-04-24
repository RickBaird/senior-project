import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
  final String peerName;
  final String peerPic;
  final String peerAboutMe;
  final String insta;
  final String twitter;

  UserProfile(
      {Key key,
      @required this.peerID,
      @required this.peerName,
      @required this.peerPic,
      @required this.peerAboutMe,
      @required this.insta,
      @required this.twitter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    moveLastScreen() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            moveLastScreen();
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.teal[700],
                  Colors.teal[200],
                ]),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: new OtherUserProfile(
                    peerID: peerID,
                    peerName: peerName,
                    peerPic: peerPic,
                    peerAboutMe: peerAboutMe,
                    insta: insta,
                    twitter: twitter) ??
                new Container(
                  width: 0.0,
                  height: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}

/*class TealPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();
    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Colors.teal[400];
    canvas.drawPath(mainBackground, paint);
    Path ovalPath = Path();
    ovalPath.moveTo(0, height * 0.2);
    ovalPath.quadraticBezierTo(
        width * 0.47, height * 0.26, width * 0.54, height * 0.5);
    ovalPath.quadraticBezierTo(
        width * 0.58, height * 0.8, width * 0.1, height);
    ovalPath.lineTo(0, height);
    ovalPath.close();
    paint.color = Colors.teal[200];
    canvas.drawPath(ovalPath, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}*/

class OtherUserProfile extends StatefulWidget {
  final String title;
  DocumentSnapshot document;
  String peerID;
  String peerName;
  String peerPic;
  String peerAboutMe;
  String insta;
  String twitter;

  OtherUserProfile(
      {Key key,
      this.title,
      @required this.peerID,
      @required this.peerName,
      @required this.peerPic,
      @required this.peerAboutMe,
      @required this.insta,
      @required this.twitter})
      : super(key: key);

  @override
  _OtherUserProfileState createState() => _OtherUserProfileState(
      peerID: peerID,
      peerName: peerName,
      peerPic: peerPic,
      peerAboutMe: peerAboutMe,
      insta: insta,
      twitter: twitter);
}

class _OtherUserProfileState extends State<OtherUserProfile> {
  _OtherUserProfileState(
      {Key key,
      @required this.peerID,
      @required this.peerName,
      @required this.peerPic,
      @required this.peerAboutMe,
      @required this.insta,
      @required this.twitter});

  SharedPreferences prefs;
  String groupChatId;
  DocumentSnapshot document;
  String profileViewID;
  String peerID;
  String peerName;
  String peerPic;
  String peerAboutMe;
  String insta;
  String twitter;
  String id;
  String currentUserId;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    moveLastScreen() {
      Navigator.pop(context);
    }

    // WillPopScope to override back button on devices
    return WillPopScope(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 70.0,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            placeholder: (context, url) => Container(
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
                            width: 250.0,
                            height: 250.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return DetailScreen(peerPic: peerPic);
                        }));
                      },
                    ),
                  ])),
          SizedBox(
            width: 400,
            child: Container(
              child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      peerName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'About Me: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
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
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    peerAboutMe ?? 'Not available',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              )
            ],
          ),
          Flexible(
            child: SizedBox(
              height: 30.0,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Icon(
                              Icons.message,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Message Me!',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Chat(
                                      peerId: peerID,
                                      peerAvatar: peerPic,
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
              height: 30.0,
            ),
          ),
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10.0,
                    height: 30.0,
                  ),
                  Flexible(
                    child: Container(
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
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                    child: Text(
                      insta ?? 'Not available',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Flexible(
                child: Row(
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
                ),
              ),
            ],
          )),
        ],
      ),
      onWillPop: moveLastScreen,
    );
  }

  Widget buildItem(BuildContext context, DocumentSnapshot document) {
    moveLastScreen() {
      Navigator.pop(context);
    }

    return WillPopScope(
      onWillPop: moveLastScreen,
    );
  }

  // Uses stored firebase data to launch user's instagram
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

  // Uses stored firebase data to launch user's twitter
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

// Class to enlarge profile picture and make it clickable to exit out
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
