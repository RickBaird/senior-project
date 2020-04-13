import 'const.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Match {

  static List<String> matchId = new List();
  static List<dynamic> global;
   static List<String> matchPerc = new List();
  static List<dynamic> global2;
  static dynamic matches;
  static dynamic matchesP;
  static String BASE_URL2 = "http://ec2-3-80-145-238.compute-1.amazonaws.com:5000";




  static List<String> update(dynamic d) {
    print("update");
    matchId.clear();
    matches = d.then((matches2) {
                  // print(matches[0]);
                   global = matches2;
                 });
                // print(global);
    for(int i = 0; i < global.length; i++) {
      //print(matchId);
      //print("++++++++++++++++++++++");       
      matchId.insert(i,global[i]["id"]);
      //matchPerc.add(global[i]['perc']);
      //print(matchId);
      //print(matchPerc);
      }
      print(matchId);
      return matchId;
                   
  }
  static List<String> update2(dynamic d) {
    print("update");
    matchPerc.clear();
    matches = d.then((matchesP2) {
                  // print(matches[0]);
                   global2 = matchesP2;
                 });
                // print(global);
    for(int i = 0; i < global2.length; i++) {
     // print(matchPerc);
      //print("++++++++++++++++++++++");       
      matchPerc.insert(i,global2[i]["id"]);
      //matchPerc.add(global[i]['perc']);
      //print(matchId);
      //print(matchPerc);
      }
      //print(matchPerc);
      return matchPerc;
                   
  }
  static getMatch() async {
    print("get");
    var url = BASE_URL2 + "/compare/" + currentUserId;
    final response = await http.get(url);
    dynamic d = json.decode(response.body);
   // dynamic c = update(d);
    return d;





  }
  
}