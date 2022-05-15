import 'package:flutter/material.dart';

import '../configuration.dart';

//State of the Bottom Buttons//
class AnimalCategoryBottomModel extends ChangeNotifier {
  int _number = 0;

  int get number => _number;

  set number(int number) {
    _number = number;
    notifyListeners();
  }
}

//State of the Bottom Buttons//
class AnimalSelectedModel extends ChangeNotifier {
  int _number = 0;
  int _category = 0;
  int _petsLength = CatsList.length;
  List<Map> _categoryList = CatsList;

  int get number => _number;
  int get category => _category;
  int get petsLength => _petsLength;
  List<Map> get categoryList => _categoryList;

  set number(int number) {
    _number = number;
    notifyListeners();
  }

  set category(int number) {
    _category = number;
    notifyListeners();
  }
  set petsLength(int number) {
    _petsLength = number;
    notifyListeners();
  }
  set categoryList(List<Map> list) {
    _categoryList = list;
    notifyListeners();
  }
}

//State of the Drawer Options//
class DrawerOptionModel extends ChangeNotifier {
  int _number = 1;

  int get number => _number;

  set number(int number) {
    _number = number;
    notifyListeners();
  }
}
