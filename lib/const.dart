import 'dart:ui';

final themeColor = Color(0xfff5a623);
final primaryColor = Color(0xff203152);
final greyColor = Color(0xffaeaeae);
final greyColor2 = Color(0xffE8E8E8);
String BASE_URL = "http://ec2-3-80-145-238.compute-1.amazonaws.com:5000";
String currentUserId = "";

void setUid(String id) {
  currentUserId = id;
}
