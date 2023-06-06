import 'package:flutter/material.dart';

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
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
