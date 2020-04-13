import 'package:flutter/material.dart';
import 'package:ruroomates/home.dart';
import 'package:ruroomates/questionaire_page.dart';
import 'package:ruroomates/sign_in.dart';
import 'package:ruroomates/first_screen.dart';
import 'match.dart';
import 'const.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

    Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,

      onPressed: () {
      
      signInWithGoogle().whenComplete(() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            try {
            dynamic matches = Match.getMatch();
            List<String> matches2 = Match.update(matches);
            List<String> perc = Match.update2(matches); 
            // return HomePage(matches2, perc);
            return FirstScreen();
            } catch (Exception) {
              return FirstScreen();
              
            //return HomePage(matches2, perc);
            }
        
          },
        ),
      );
    });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
