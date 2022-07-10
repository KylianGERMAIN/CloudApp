import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProviderManageCity extends ChangeNotifier {
  int? _actualcity = 0;
  double _actualtemp = 0;
  String _actuallogo = "04d";
  String _actualdescription = "";
  String _actualWind = "";
  String _actualHumidity = "";

  final List<String> _listCity = [
    "Paris",
    "Moscou",
    "London",
    "Dubai",
    "Tomsk",
  ];

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

  String get getactualWind {
    return _actualWind;
  }

  String get getactualHumidity {
    return _actualHumidity;
  }

  void manageCity(int? actualCity) async {
    _actualcity = actualCity;
    var city = _listCity[actualCity!];
    getApicity(city);
  }

  void removeCity(int? removedcity) async {
    _listCity.removeAt(removedcity!);
    if (removedcity < _actualcity!) {
      _actualcity = (_actualcity! - 1);
    }
    notifyListeners();
  }

  void getApicity(String city) async {
    var dio = Dio();
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${dotenv.env['WEATHER_API_KEY']}&units=metric');
    // print(result);
    _actualtemp = response.data['main']['temp'].toDouble();
    _actuallogo = response.data['weather'][0]['icon'];
    _actualdescription = response.data['weather'][0]['description'];
    _actualWind = response.data['wind']['speed'].toString();
    _actualHumidity = response.data['main']['humidity'].toString();
    notifyListeners();
  }

  void addcity(String newCity) async {
    try {
      var dio = Dio();
      await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?q=$newCity&appid=${dotenv.env['WEATHER_API_KEY']}&units=metric');
      _listCity.add(newCity);
    } catch (e) {}

    notifyListeners();
  }
}
