import 'package:flutter/material.dart';

class ProviderManageCity extends ChangeNotifier {
  Object _actualcity = 0;

  Object get getActualCity {
    return _actualcity;
  }

  void manageCity(Object actualCity) {
    _actualcity = actualCity;
    notifyListeners();
  }
}
