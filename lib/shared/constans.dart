import 'package:flutter/material.dart';

const kTextColor = Color(0xFF999999);
const kTextLightColor = Color(0xFF555555);
const kTextBoldLightColor = Colors.black;
const kTextBoldColor = Colors.white;

const kDefaultPadding = 20.0;

final kDefaultStrongShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  spreadRadius: 5,
  blurRadius: 7,
  offset: Offset(0, 3), // changes position of shadow
);

final kDefaultShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.3),
  spreadRadius: 1,
  blurRadius: 2,
  offset: Offset(0, 2.5), // changes position of shadow
);

// TextField dedign
final kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

final kDefaultOutlineInputBorder = OutlineInputBorder(
  // Maybe flutter team need to fix it on web
  // borderRadius: BorderRadius.circular(50),
  borderSide: BorderSide(
    color: Color(0xFFCEE4FD),
  ),
);
