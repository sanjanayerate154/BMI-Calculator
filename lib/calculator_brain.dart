import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;
  String CalculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String interpretation() {
    if (_bmi >= 25) {
      return 'Your have higher than body weight try to excercise';
    } else if (_bmi > 18.5) {
      return ' you are Normal..good!! follow ur diet well !!';
    } else {
      return 'You have lower than normal body weight excercise well ';
    }
  }
}
