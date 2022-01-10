import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:provider/provider.dart';
import '../Provider/ManageCity.dart';

class MyTemperatureInterface extends StatelessWidget {
  const MyTemperatureInterface({Key? key}) : super(key: key);


  Widget weatherIcon(BuildContext context) {

    ProviderManageCity providerManageCity = Provider.of<ProviderManageCity>(context, listen: true);
    print(providerManageCity.getactualLogo);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.27,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network('http://openweathermap.org/img/wn/${providerManageCity.getactualLogo}@4x.png',),
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

    ProviderManageCity providerManageCity = Provider.of<ProviderManageCity>(context, listen: true);

    return Column(
      children: [
        weatherIcon(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.27,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(providerManageCity.getactualdescription),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(providerManageCity.getActualTemp.toString(),
                    style: const TextStyle(
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
