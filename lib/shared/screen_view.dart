import 'package:flutter/material.dart';

isMobileView(BuildContext context) {
  return MediaQuery.of(context).size.width ~/ 300 <=2;
}
