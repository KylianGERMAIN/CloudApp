import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class MyTemperatureInterface extends StatelessWidget {
  const MyTemperatureInterface({Key? key}) : super(key: key);

  Widget weatherIcon(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.27,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Icon(WeatherIcons.day_sunny, size: 150, color: Colors.black)
        ],
      ),
    );
  }

  Widget weatherInformations(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[
        Icon(
          Icons.emoji_flags,
          color: Colors.black,
        ),
        Text(
          "16km/h",
        ),
      ]),
      const SizedBox(width: 20),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[
        Icon(
          Icons.opacity,
          color: Colors.black,
        ),
        Text(
          "34%",
        )
      ]),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        weatherIcon(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.27,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Sunny"),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0),
                child: Text("18",
                    style: TextStyle(
                      fontSize: 90,
                    )),
              ),
              weatherInformations(context)
            ],
          ),
        )
      ],
    );
  }
}
