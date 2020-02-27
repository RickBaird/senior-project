import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
   void initState(){
    super.initState();
    for (var i =0;i<answer.length;i++){
      answer[i] =0;
    }
  }
  setSelctedRadio(int holder,int val){
    setState(() {
      answer[holder] =val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Question'),
        ),
        body: SingleChildScrollView(
          padding : EdgeInsets.all(8.0),
            child: new Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  // Question 1
                  new Text('question 1'),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio(value: 1,
                  groupValue: answer[0],
                  onChanged: (val){
                    setSelctedRadio(0,val);
                    print("Q1 $answer");
                  }
                  ),
                  new Text('Answer 1'),
                  new Radio(value: 2,
                      groupValue: answer[0],
                      onChanged: (val){
                        setSelctedRadio(0,val);
                        print("Q1 $answer");
                      }),
                  new Text('Answer 2'),
                  new Radio(value: 3,
                      groupValue: answer[0],
                      onChanged: (val){
                        setSelctedRadio(0,val);
                        print("Q1 $answer");
                      }),
                  new Text('Answer 3'),
                ]),
                  new Text('question 2'),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(value: 1,
                            groupValue: answer[1],
                            onChanged: (val){
                              setSelctedRadio(1,val);
                              print("Q2 $answer");
                      }),
                        new Text('Answer 1'),
                        new Radio(value: 2,
                            groupValue: answer[1],
                            onChanged: (val){
                              setSelctedRadio(1,val);
                              print("Q2 $answer");
                            }),
                        new Text('Answer 2'),
                        new Radio(value: 3,
                            groupValue: answer[1],
                            onChanged: (val){
                              setSelctedRadio(1,val);
                              print("Q2 $answer");
                            }),
                        new Text('Answer 3'),
                      ]),
                  new Text('question 3'),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(value: 1,
                            groupValue: answer[2],
                            onChanged: (val){
                              setSelctedRadio(2,val);
                              print("Q3 $answer");
                            }),
                        new Text('Answer 1'),
                        new Radio(value: 2,
                            groupValue: answer[2],
                            onChanged: (val){
                              setSelctedRadio(2,val);
                              print("Q3 $answer");
                            }),
                        new Text('Answer 2'),
                        new Radio(value: 3,
                            groupValue: answer[2],
                            onChanged: (val){
                              setSelctedRadio(2,val);
                              print("Q3 $answer");
                            }),
                        new Text('Answer 3'),
                      ]),
                  new Text('question 4'),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(value: 1,
                            groupValue: answer[3],
                            onChanged: (val){
                              setSelctedRadio(3,val);
                              print("Q4 $answer");
                            }),
                        new Text('Answer 1'),
                        new Radio(value: 2,
                            groupValue: answer[3],
                            onChanged: (val){
                              setSelctedRadio(3,val);
                              print("Q4 $answer");
                            }),
                        new Text('Answer 2'),
                        new Radio(value: 3,
                            groupValue: answer[3],
                            onChanged: (val){
                              setSelctedRadio(3,val);
                              print("Q4 $answer");
                            }),
                        new Text('Answer 3'),
                      ]),
                  new Text('question 5'),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(value: 1,
                            groupValue: answer[4],
                            onChanged: (val){
                              setSelctedRadio(4,val);
                              print("Q4 $answer");
                            }),
                        new Text('Answer 1'),
                        new Radio(value: 2,
                            groupValue: answer[4],
                            onChanged: (val){
                              setSelctedRadio(4,val);
                              print("Q4 $answer");
                            }),
                        new Text('Answer 2'),
                        new Radio(value: 3,
                            groupValue: answer[4],
                            onChanged: (val){
                              setSelctedRadio(4,val);
                              print("Q4 $answer");
                            }),
                        new Text('Answer 3'),
                      ]),
                  new Text('question 6'),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(value: 1,
                            groupValue: answer[5],
                            onChanged: (val){
                              setSelctedRadio(5,val);
                              print("Q5 $answer");
                            }),
                        new Text('Answer 1'),
                        new Radio(value: 2,
                            groupValue: answer[5],
                            onChanged: (val){
                              setSelctedRadio(5,val);
                              print("Q5 $answer");
                            }),
                        new Text('Answer 2'),
                        new Radio(value: 3,
                            groupValue: answer[5],
                            onChanged: (val){
                              setSelctedRadio(5,val);
                              print("Q5 $answer");
                            }),
                        new Text('Answer 3'),
                      ]),
                  new Text('question 7'),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(value: 1,
                            groupValue: answer[6],
                            onChanged: (val){
                              setSelctedRadio(6,val);
                              print("Q6 $answer");
                            }),
                        new Text('Answer 1'),
                        new Radio(value: 2,
                            groupValue: answer[6],
                            onChanged: (val){
                              setSelctedRadio(6,val);
                              print("Q6 $answer");
                            }),
                        new Text('Answer 2'),
                        new Radio(value: 3,
                            groupValue: answer[6],
                            onChanged: (val){
                              setSelctedRadio(6,val);
                              print("Q6 $answer");
                            }),
                        new Text('Answer 3'),
                      ]),
                  new Text('question 8'),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(value: 1,
                            groupValue: answer[7],
                            onChanged: (val){
                              setSelctedRadio(7,val);
                              print("Q8 $answer");
                            }),
                        new Text('Answer 1'),
                        new Radio(value: 2,
                            groupValue: answer[7],
                            onChanged: (val){
                              setSelctedRadio(7,val);
                              print("Q8 $answer");
                            }),
                        new Text('Answer 2'),
                        new Radio(value: 3,
                            groupValue: answer[7],
                            onChanged: (val){
                              setSelctedRadio(7,val);
                              print("Q8 $answer");
                            }),
                        new Text('Answer 3'),
                      ]),
                  new Text('question 9'),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(value: 1,
                            groupValue: answer[8],
                            onChanged: (val){
                              setSelctedRadio(8,val);
                              print("Q9 $answer");
                            }),
                        new Text('Answer 1'),
                        new Radio(value: 2,
                            groupValue: answer[8],
                            onChanged: (val){
                              setSelctedRadio(8,val);
                              print("Q9 $answer");
                            }),
                        new Text('Answer 2'),
                        new Radio(value: 3,
                            groupValue: answer[8],
                            onChanged: (val){
                              setSelctedRadio(8,val);
                              print("Q9 $answer");
                            }),
                        new Text('Answer 3'),
                      ]),

                  new Text('question 10'),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(value: 1,
                            groupValue: answer[9],
                            onChanged: (val){
                              setSelctedRadio(9,val);
                              print("Q10 $answer");
                            }),
                        new Text('Answer 1'),
                        new Radio(value: 2,
                            groupValue: answer[9],
                            onChanged: (val){
                              setSelctedRadio(9,val);
                              print("Q10 $answer");
                            }),
                        new Text('Answer 2'),
                        new Radio(value: 3,
                            groupValue: answer[9],
                            onChanged: (val){
                              setSelctedRadio(9,val);
                              print("Q10 $answer");
                            }),
                        new Text('Answer 3'),

                      ]),
        ])
    ));
  }
}
