import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:ruroomates/first_screen.dart';
import 'package:ruroomates/sign_in.dart';
import 'package:ruroomates/login_page.dart';
import 'package:ruroomates/messages.dart';
import 'package:ruroomates/user.dart';
import 'package:ruroomates/Chat.dart';

import 'const.dart';


// ignore: must_be_immutable
class HomePage extends StatelessWidget {

  DocumentSnapshot document;
  String peerID;
  String currentUserId;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: "Home",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Home Page"),
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
            //backgroundColor: Colors.yellow,
          ),
          drawer: new Drawer(
              child: new ListView(
                children: <Widget>[

                  new UserAccountsDrawerHeader(accountName: Text(name), accountEmail: Text(email),
                    decoration: new BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Colors.teal[700],
                              Colors.teal[200],
                            ]
                        )
                    ),
                    currentAccountPicture: new GestureDetector(
                      child: new CircleAvatar(
                          backgroundImage: NetworkImage(imageUrl)
                      ),
                    ),),

                  new ListTile(

                    title: new Text("Profile"),
                    trailing:
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        imageUrl,
                      ),
                      radius: 12,
                      backgroundColor: Colors.transparent,
                    ),
                    onTap: () {
                      print(peerID);
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new FirstScreen(peerID: peerID)));
                    },
                  ),

                  new ListTile(
                    title: new Text("Messages"),
                    trailing:
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        imageUrl,
                      ),
                      radius: 12,
                      backgroundColor: Colors.transparent,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Messages(currentUserId: prefs.getString('id'))));
                    },
                  ),

                  new ListTile(
                    title: new Text("Sign Out"),
                    trailing:
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        ("assets/sign_out.png"),
                      ),
                      radius: 12,
                      backgroundColor: Colors.transparent,
                    ),
                    onTap: () {
                      signOutGoogle();
                      Navigator.of(context).popUntil((route)=>route.isFirst);
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
                    },
                  ),
                ],
              )
          ),
          body: Container(
            color: Colors.teal[500],
//            decoration: BoxDecoration(
//                color: greyColor,
//                /* INSANE SHADOW */
//                boxShadow: [
//                  BoxShadow(
//                      color: Colors.grey[600],
//                      offset: Offset(4.0, 4.0),
//                      blurRadius: 15.0,
//                      spreadRadius: 1.0
//                  ),
//                  BoxShadow(
//                      color: Colors.white,
//                      offset: Offset(-4.0, -4.0),
//                      blurRadius: 15.0,
//                      spreadRadius: 1.0
//                  ),
//                ],
//                gradient: LinearGradient(
//                  begin: Alignment.topLeft,
//                  end: Alignment.bottomRight,
//                  colors: [
//                    Colors.yellow[500],
//                    Colors.brown[300],
//                    Colors.brown[400],
//                    Colors.brown[700],
//                  ],
//                  stops: [0.1, 0.3, 0.8, 0.9],
//                )
//            ),
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Stack(
              children: <Widget>[
                // List
                Container(
                  child: StreamBuilder(
                    stream: Firestore.instance.collection('users').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          padding: EdgeInsets.all(10.0),
                          itemBuilder: (context, index) => buildItem(context, snapshot.data.documents[index]),
                          itemCount: snapshot.data.documents.length,
                        );
                      }
                    },
                  ),
                ),

                // Loading
                Positioned(
                  child: isLoading
                      ? Container(
                    child: Center(
                      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(themeColor)),
                    ),
                    color: Colors.white.withOpacity(0.8),
                  )
                      : Container(),
                )
              ],
            ),
          ),
        )
    );
  }



  Widget buildItem(BuildContext context, DocumentSnapshot document) {
    if (document['id'] == currentUserId) {
      return Container();
    } else {
      return Container(
        child: FlatButton(
          child: Row(
            children: <Widget>[
              Material(
                child: document['photoUrl'] != null
                    ? CachedNetworkImage(
                  placeholder: (context, url) => Container(
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
              Flexible(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '${document['nickname']}',
                          style: TextStyle(color: primaryColor),
                        ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                      ),
                      Container(
                        child: Text(
                          'About me: ${document['aboutMe'] ?? 'Not available'}',
                          style: TextStyle(color: primaryColor),
                          maxLines: 2,
                        ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      )
                    ],
                  ),
                  margin: EdgeInsets.only(left: 20.0),
                ),
              ),
              Container(
                height: 60.0,
                width: 60.0,
                padding: EdgeInsets.only(left: 12.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: greyColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[600],
                        offset: Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.grey[200],
                        Colors.grey[300],
                        Colors.grey[400],
                        Colors.grey[500],
                      ],
                      stops: [0.1, 0.3, 0.8, 0.9],
                    )
                  ),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          '80%',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
              )
            ],
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserProfile(
                      peerID: '${document['id']}',
                      peerName: '${document['nickname']}',
                      peerPic: document['photoUrl'],
                      peerAboutMe: '${document['aboutMe'] ?? 'Not available'}',
                      insta:       '${document['instagram'] ?? 'Not available'}',
                      twitter:     '${document['twitter'] ?? 'Not available'}',
                      //peerAboutMe: document['aboutMe']
                    )
                )
            ); // Push
          },
          color: greyColor2,
          padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        margin: EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
      );
    }
  }
}
