import 'package:flutter/material.dart';

final kCardDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: const [
    BoxShadow(
      color: Color(0xffDDDDDD),
      blurRadius: 6.0,
      spreadRadius: 2.0,
      offset: Offset(0.0, 0.0),
    )
  ],
  borderRadius: BorderRadius.circular(10),
);

const kButtonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 75, 170, 218),
      Color.fromARGB(255, 0, 61, 90),
    ]);

const kreviewTitle = TextStyle(
    fontSize: 30, fontFamily: 'alkatra', fontWeight: FontWeight.normal);

const kreviewDescription = TextStyle(fontSize: 17);

const krating = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
        BorderSide(color: Color.fromARGB(255, 19, 170, 239), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
        BorderSide(color: Color.fromARGB(255, 19, 170, 239), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
