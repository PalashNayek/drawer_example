import 'package:flutter/material.dart';

class DrawerViewModel extends ChangeNotifier {
  int _selectedScreenIndex = 0;

  int get selectedScreenIndex => _selectedScreenIndex;

  void setSelectedScreenIndex(int index) {
    _selectedScreenIndex = index;
    notifyListeners();
  }
}
