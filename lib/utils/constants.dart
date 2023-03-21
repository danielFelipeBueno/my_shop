import 'package:flutter/material.dart';

//$Colors
const Color kPrimaryColor = Color(0xffDA0063);
const Color kSecondaryColor = Color(0xff050038);

//$TextStyle
const textTitleActiveStyle = TextStyle(
    fontSize: 22, fontWeight: FontWeight.bold, color: kSecondaryColor);
const textTitleInactiveStyle = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w400, color: kSecondaryColor);

const String userId = '6417dcba07fbfaccdcb2af84';
const String defaultProfile = 'https://qph.cf2.quoracdn.net/main-qimg-2b21b9dd05c757fe30231fac65b504dd';

List<BoxShadow> boxShadowCard = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 2,
    blurRadius: 5,
    offset: const Offset(0, 3), // changes position of shadow
  ),
];