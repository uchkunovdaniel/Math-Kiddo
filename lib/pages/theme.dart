import 'package:flutter/material.dart';

TextStyle appBarTextStyle = TextStyle(
    color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'RobotoSlab-Regular');
TextStyle levelTitleTextStyle = TextStyle(
    fontFamily: 'LXGWWenKaiMonoTC', fontSize: 20);
TextStyle levelSubtitleTextStyle = TextStyle(
    fontFamily: 'LXGWWenKaiMonoTC', fontSize: 14);
EdgeInsets itemPadding = EdgeInsets.all(10.0);

Color appBarColor = Color(0x00ffffff);
Color scaffoldBackgroundColor = Color(0x00ffffff);
List<Color> levelColors = [
  Color(0x00ffffff),
  Color(0x00ffffff),
  Color(0x00ffffff),
  Color(0x00ffffff),
  Color(0x00ffffff)
];

void blueTheme(){
appBarColor = Color.fromARGB(255, 92, 182, 188);
scaffoldBackgroundColor = Color.fromARGB(255, 227, 242, 243);
levelColors = [
  Color.fromARGB(255, 191, 240, 243),
  Color.fromARGB(255, 170, 241, 246),
  Color.fromARGB(255, 143, 230, 236),
  Color.fromARGB(255, 115, 204, 211),
  Color.fromARGB(255, 65, 180, 188)
];
}

void pinkTheme(){
    appBarColor = Color.fromARGB(255, 255, 187, 204);
    scaffoldBackgroundColor = Color.fromARGB(255, 255, 248, 238);
    levelColors[0] = Color.fromARGB(255, 255, 238, 204);
    levelColors[1] = Color.fromARGB(255, 255, 221, 204);
    levelColors[2] = Color.fromARGB(255, 255, 204, 204);
    levelColors[3] = Color.fromARGB(255, 255, 187, 204);
    levelColors[4] = Color.fromARGB(255, 255, 170, 204);
}

void greyTheme(){
  appBarColor = Color.fromARGB(255, 96, 114, 116);
  scaffoldBackgroundColor = Color.fromARGB(255, 183, 181, 175);
  levelColors[0] = Color.fromARGB(255, 250, 238, 209);
  levelColors[1] = Color.fromARGB(255, 222, 208, 182);
  levelColors[2] = Color.fromARGB(255, 178, 165, 155);
  levelColors[3] = Color.fromARGB(255, 96, 114, 116);
  levelColors[4] = Color.fromARGB(255, 60, 71, 73);
}
