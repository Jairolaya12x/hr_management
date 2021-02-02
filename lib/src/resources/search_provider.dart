import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  bool _isSearchMode = false;

  set isSearchMode(bool value) {
    _isSearchMode = value;
    notifyListeners();
  }
  get isSearchMode => _isSearchMode;

}