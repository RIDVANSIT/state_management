import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier{
  String _helloText = "Hello";

  String get helloText => _helloText;

  set helloText(String value) {
    _helloText = value;
    notifyListeners();
  }

  bool _checked = false;

  bool get checked => _checked;

  set checked(bool value) {
    _checked = value;
    notifyListeners();
  }
}