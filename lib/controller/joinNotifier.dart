import 'package:flutter/material.dart';

class JoinNotifier extends ChangeNotifier {
  bool _joined = false;
  bool get joined => _joined; //getter to get index value
  set joinNow(bool joinedNow) {
    _joined = joinedNow;
    notifyListeners();
  } //setter to get index value
}
