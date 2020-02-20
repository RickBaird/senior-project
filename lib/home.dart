import 'package:flutter/material.dart';
import 'package:ruroomates/first_screen.dart';
import 'package:ruroomates/sign_in.dart';
import 'package:ruroomates/login_page.dart';
import 'package:ruroomates/messages.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: "Home",
      home: Scaffold(
        appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.blueAccent,
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
                
              new UserAccountsDrawerHeader(accountName: Text(name), accountEmail: Text(email),
              decoration: new BoxDecoration(color: Colors.blueAccent),
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
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new FirstScreen()));
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

              // new ListTile(
              //   title: new Text("Close"),
              //   trailing: 
              //     new Icon(Icons.cancel),
              //     onTap: () { 
              //     Navigator.of(context).pop();
              //   },
              // )

            ],
          )
        ),
        body: Center(child: Text("Test"),
        ),
      ),
    );
  }
}