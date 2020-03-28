import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import'package:ruroomates/Chat.dart';
import 'package:ruroomates/sign_in.dart';
import 'package:ruroomates/user.dart';
import 'package:ruroomates/first_screen.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionnairePage extends StatelessWidget {
  // This widget is the root of your application.
  DocumentSnapshot document;
  final String peerID ;

  QuestionnairePage({Key key, @required this.peerID}): super (key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stateless App Template',
      theme: ThemeData(
      ),
      home: Home(peerID: peerID),
    );
  }
}

class Home extends StatefulWidget {
  String peerID;

  Home({Key key, @required this.peerID}): super(key:key);
  @override
  _HomeState createState() => _HomeState(peerID: peerID);
}

class _HomeState extends State<Home> {
  DocumentSnapshot document;
  String peerID ;

  _HomeState({Key key, @required this.peerID});
    List<int> answer = new List(10);

  var clickable ;
   // the id from the fire base
  var userinfo = Firestore.instance.collection("users").document("id").toString();


  @override
  void initState() {
    super.initState();
    for (var i = 0; i < answer.length; i++) {
        answer[i] = 0;
    }
  }
  setSelctedRadio(int holder, int val) {
    setState(() {
      answer[holder] = val;
    });
    checkedempty();
  }
  SharedPreferences pref;
 checkedempty() async {
    pref = await SharedPreferences.getInstance();
    var counter =0;
    for (var i=0;i<answer.length;i++){
      if(answer[i]>0){
        counter++;
      };
    }
    if (counter == 10){
      clickable=(){
        peerID = pref.getString( 'id') ?? '' ;
        Firestore.instance.collection('users').document(peerID);

        Map toJson()=>{
          'id': peerID,
          'q1': answer[0],
          'q2': answer[1],
          'q3': answer[2],
          'q4': answer[3],
          'q5': answer[4],
          'q6': answer[5],
          'q7': answer[6],
          'q8': answer[7],
          'q9': answer[8],
          'q10': answer[9],
        };
        String userAnser = jsonEncode(toJson());
        print (userAnser);

       Navigator.of(context).pop();
       2 Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  FirstScreen()));
      };
    }
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Questionaire'),
          flexibleSpace: Container(
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
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Question 1
                new Text('Question 1:', textAlign: TextAlign.start,
                    style: new TextStyle (fontWeight: FontWeight.bold)),
                new Text('What year are you?', textAlign: TextAlign.center,),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 1,
                          groupValue: answer[0],
                          onChanged: (val) {
                            setSelctedRadio(0, val);

                          }),
                      new Text('freshman'), // Answer 1
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 2,
                          groupValue: answer[0],
                          onChanged: (val) {
                            setSelctedRadio(0, val);

                          }),
                      new Text('sophomore'), // Answer 2
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 3,
                          groupValue: answer[0],
                          onChanged: (val) {
                            setSelctedRadio(0, val);

                          }),
                      new Text('junior'), // Answer 3
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 4,
                          groupValue: answer[0],
                          onChanged: (val) {
                            setSelctedRadio(0, val);

                          }),
                      new Text('senior'), // Answer 4
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 5,
                          groupValue: answer[0],
                          onChanged: (val) {
                            setSelctedRadio(0, val);

                          }),
                      new Text('graduate'), // Answer 5
                    ]),
                new Text(' '),
                // Question 2
                new Text('Question 2:', textAlign: TextAlign.start,
                    style: new TextStyle (fontWeight: FontWeight.bold)),
                new Text('Do you want to live on or off campus?',
                  textAlign: TextAlign.center,),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 1,
                          groupValue: answer[1],
                          onChanged: (val) {
                            setSelctedRadio(1, val);

                          }),
                      new Text('on'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 2,
                          groupValue: answer[1],
                          onChanged: (val) {
                            setSelctedRadio(1, val);

                          }),
                      new Text('off'),
                    ]),
                new Text(' '),
                // Question 3
                new Text('Question 3:', textAlign: TextAlign.start,
                    style: new TextStyle (fontWeight: FontWeight.bold)),
                new Text('What is your preferred form of communication?',
                  textAlign: TextAlign.center,),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 1,
                          groupValue: answer[2],
                          onChanged: (val) {
                            setSelctedRadio(2, val);

                          }),
                      new Text('texting'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 2,
                          groupValue: answer[2],
                          onChanged: (val) {
                            setSelctedRadio(2, val);

                          }),
                      new Text('calling'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 3,
                          groupValue: answer[2],
                          onChanged: (val) {
                            setSelctedRadio(2, val);

                          }),
                      new Text('social media'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 4,
                          groupValue: answer[2],
                          onChanged: (val) {
                            setSelctedRadio(2, val);

                          }),
                      new Text('email'),
                    ]),
                new Text(' '),
                // Question 4
                new Text('Question 4:', textAlign: TextAlign.start,
                    style: new TextStyle (fontWeight: FontWeight.bold)),
                new Text('What kind of personality do you have?',
                  textAlign: TextAlign.center,),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 1,
                          groupValue: answer[3],
                          onChanged: (val) {
                            setSelctedRadio(3, val);

                          }),
                      new Text('introvert'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 2,
                          groupValue: answer[3],
                          onChanged: (val) {
                            setSelctedRadio(3, val);

                          }),
                      new Text('ambivert'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 3,
                          groupValue: answer[3],
                          onChanged: (val) {
                            setSelctedRadio(3, val);

                          }),
                      new Text('extrovert'),
                    ]),
                new Text(' '),
                // Question 5
                new Text('Question 5:', textAlign: TextAlign.start,
                    style: new TextStyle (fontWeight: FontWeight.bold)),
                new Text('What is the condition your room is kept in?',
                  textAlign: TextAlign.center,),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 1,
                          groupValue: answer[4],
                          onChanged: (val) {
                            setSelctedRadio(4, val);

                          }),
                      new Text('clean'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 2,
                          groupValue: answer[4],
                          onChanged: (val) {
                            setSelctedRadio(4, val);

                          }),
                      new Text('messy'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 3,
                          groupValue: answer[4],
                          onChanged: (val) {
                            setSelctedRadio(4, val);

                          }),
                      new Text('in between'),
                    ]),
                new Text(' '),
                // Question 6
                new Text('Question 6: ', textAlign: TextAlign.start,
                    style: new TextStyle (fontWeight: FontWeight.bold)),
                new Text('How often do you clean your space?',
                  textAlign: TextAlign.center,),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 1,
                          groupValue: answer[5],
                          onChanged: (val) {
                            setSelctedRadio(5, val);

                          }),
                      new Text('once a day'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 2,
                          groupValue: answer[5],
                          onChanged: (val) {
                            setSelctedRadio(5, val);

                          }),
                      new Text('once a week'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 3,
                          groupValue: answer[5],
                          onChanged: (val) {
                            setSelctedRadio(5, val);

                          }),
                      new Text('once a month'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 4,
                          groupValue: answer[5],
                          onChanged: (val) {
                            setSelctedRadio(5, val);

                          }),
                      new Text('as needed'),
                    ]),
                new Text(' '),
                // Question 7
                new Text('Question 7:', textAlign: TextAlign.start,
                    style: new TextStyle (fontWeight: FontWeight.bold)),
                new Text('When are you most productive?',
                  textAlign: TextAlign.center,),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 1,
                          groupValue: answer[6],
                          onChanged: (val) {
                            setSelctedRadio(6, val);

                          }),
                      new Text('morning (8am-noon)'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 2,
                          groupValue: answer[6],
                          onChanged: (val) {
                            setSelctedRadio(6, val);

                          }),
                      new Text('afternoon (noon-5pm)'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 3,
                          groupValue: answer[6],
                          onChanged: (val) {
                            setSelctedRadio(6, val);

                          }),
                      new Text('evening (5pm-10pm)'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 4,
                          groupValue: answer[6],
                          onChanged: (val) {
                            setSelctedRadio(6, val);

                          }),
                      new Text('late evening (after 10pm)'),
                    ]),
                new Text(' '),
                // Question 8
                new Text('Question 8:', textAlign: TextAlign.start,
                    style: new TextStyle (fontWeight: FontWeight.bold)),
                new Text('What time do you go to bed on a weeknight?',
                  textAlign: TextAlign.center,),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 1,
                          groupValue: answer[7],
                          onChanged: (val) {
                            setSelctedRadio(7, val);

                          }),
                      new Text('9pm-11pm'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 2,
                          groupValue: answer[7],
                          onChanged: (val) {
                            setSelctedRadio(7, val);

                          }),
                      new Text('11pm-1am'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 3,
                          groupValue: answer[7],
                          onChanged: (val) {
                            setSelctedRadio(7, val);

                          }),
                      new Text('after 1am'),
                    ]),
                new Text(' '),
                // Question 9
                new Text('Question 9:', textAlign: TextAlign.start,
                    style: new TextStyle (fontWeight: FontWeight.bold)),
                new Text('What time do you go to bed on a weekend?',
                  textAlign: TextAlign.center,),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 1,
                          groupValue: answer[8],
                          onChanged: (val) {
                            setSelctedRadio(8, val);

                          }),
                      new Text('9pm-11pm'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 2,
                          groupValue: answer[8],
                          onChanged: (val) {
                            setSelctedRadio(8, val);

                          }),
                      new Text('11pm-1am'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 3,
                          groupValue: answer[8],
                          onChanged: (val) {
                            setSelctedRadio(8, val);

                          }),
                      new Text('after 1am'),
                    ]),
                new Text(' '),
                // Question 10
                new Text('Question 10:', textAlign: TextAlign.start,
                    style: new TextStyle (fontWeight: FontWeight.bold)),
                new Text('What are your ideal plans on a weekend/day off?',
                  textAlign: TextAlign.start,),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 1,
                          groupValue: answer[9],
                          onChanged: (val) {
                            setSelctedRadio(9, val);

                          }),
                      new Text('staying in to read or watch TV'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 2,
                          groupValue: answer[9],
                          onChanged: (val) {
                            setSelctedRadio(9, val);

                          }),
                      new Text('Hanging out with friends'),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                          value: 3,
                          groupValue: answer[9],
                          onChanged: (val) {
                            setSelctedRadio(9, val);

                          }),
                      new Text('Going out and exploring '),
                    ]),
                new Row(
                  children: <Widget>[

                      RaisedButton(
                          onPressed: clickable,
                          child: Text('Submit')
                      )

                  ]
                )
              ]),
        ));
  }
}
