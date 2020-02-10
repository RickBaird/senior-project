import 'package:flutter/material.dart';
import 'package:ruroomates/first_screen.dart';

class QuestionairePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return FirstScreen();
                    },
                  ),
                );
                },
                color: Colors.lightBlue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Save and Exit',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
            ]
          )
        )
      )
    );
  }
}