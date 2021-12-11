import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class MyTemperatureInterface extends StatelessWidget {
  const MyTemperatureInterface({Key? key}) : super(key: key);


  Widget weatherIcon(BuildContext context) {
    return Container(
          color: Colors.brown,
          height: MediaQuery.of(context).size.height * 0.27,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            children: const <Widget>[
              Icon(WeatherIcons.day_sunny, size: 150, color: Colors.yellow)
            ],
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        weatherIcon(context),
        Container(
          color: Colors.orange,
          height: MediaQuery.of(context).size.height * 0.27,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Sunny"),
              const Text("18", style: TextStyle(fontSize: 90,)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                Text("16km/h"),
                SizedBox(width: 20),
                Text("32%"),
              ]),
            ],
          ),
        )
      ],
    ));
  }
}
