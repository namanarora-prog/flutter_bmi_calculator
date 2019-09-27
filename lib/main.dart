import 'package:flutter/material.dart';
import './ui/BMI.dart';

void main(){
  runApp(
    MaterialApp(
      title: "BMI",
      home: BMI(),
      theme: ThemeData(fontFamily: 'norwester'),
    )
  );
}