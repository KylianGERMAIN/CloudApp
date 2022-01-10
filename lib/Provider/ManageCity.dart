import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:math';


class ProviderManageCity extends ChangeNotifier {
  int? _actualcity = 0;
  double _actualtemp = 0;
  String _actuallogo = "04d";
  String _actualdescription = "";

  final List<String> _listCity = ["Paris", "Moscou", "London", "Dubai"];

  int? get getActualCity {
    return _actualcity;
  }

  double get getActualTemp {
    return _actualtemp;
  }

  List<String> get getlistCity {
    return _listCity;
  }

  String get getactualLogo {
    return _actuallogo;
  }
  String get getactualdescription {
    return _actualdescription;
  }



  void manageCity(int? actualCity) async {
    _actualcity = actualCity;
    var city = _listCity[actualCity!];
    getApicity(city);
    notifyListeners();
  }

  void getApicity(String city) async {

    var dio = Dio();
    var key = dotenv.env['WEATHER_API_KEY'];
    final response = await dio.get('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${dotenv.env['WEATHER_API_KEY']}&units=metric');
    // print(result);
    _actualtemp = response.data['main']['temp'].toDouble();
    _actuallogo = response.data['weather'][0]['icon'];
    _actualdescription = response.data['weather'][0]['description'];
    notifyListeners();
  }

  void addcity(String newCity) {
    _listCity.add(newCity);
    notifyListeners();
  }
}
