import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class QuestionnairePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stateless App Template',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> answer = new List(10);

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Questionaire'),
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
                            print("Q1 $answer");
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
                            print("Q1 $answer");
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
                            print("Q1 $answer");
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
                            print("Q1 $answer");
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
                            print("Q1 $answer");
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
                            print("Q2 $answer");
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
                            print("Q2 $answer");
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
                            print("Q3 $answer");
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
                            print("Q3 $answer");
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
                            print("Q3 $answer");
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
                            print("Q3 $answer");
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
                            print("Q4 $answer");
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
                            print("Q4 $answer");
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
                            print("Q4 $answer");
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
                            print("Q4 $answer");
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
                            print("Q4 $answer");
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
                            print("Q4 $answer");
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
                            print("Q5 $answer");
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
                            print("Q5 $answer");
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
                            print("Q5 $answer");
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
                            print("Q5 $answer");
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
                            print("Q6 $answer");
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
                            print("Q6 $answer");
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
                            print("Q6 $answer");
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
                            print("Q6 $answer");
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
                            print("Q8 $answer");
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
                            print("Q8 $answer");
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
                            print("Q8 $answer");
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
                            print("Q9 $answer");
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
                            print("Q9 $answer");
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
                            print("Q9 $answer");
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
                            print("Q10 $answer");
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
                            print("Q10 $answer");
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
                            print("Q10 $answer");
                          }),
                      new Text('Going out and exploring '),
                    ]),
              ]),
        ));
  }
}
