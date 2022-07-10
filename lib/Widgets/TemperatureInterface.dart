import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/ManageCity.dart';

class MyTemperatureInterface extends StatelessWidget {
  const MyTemperatureInterface({Key? key}) : super(key: key);

  Widget weatherIcon(BuildContext context) {
    ProviderManageCity providerManageCity =
        Provider.of<ProviderManageCity>(context, listen: true);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            'http://openweathermap.org/img/wn/${providerManageCity.getactualLogo}@4x.png',
          ),
        ],
      ),
    );
  }

  Widget weatherInformations(BuildContext context) {
    ProviderManageCity providerManageCity =
        Provider.of<ProviderManageCity>(context, listen: true);

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        const Icon(
          Icons.emoji_flags,
          color: Colors.black,
        ),
        Text(
          providerManageCity.getactualWind + "km/h",
        ),
      ]),
      const SizedBox(width: 20),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        const Icon(
          Icons.opacity,
          color: Colors.black,
        ),
        Text(
          providerManageCity.getactualHumidity + "%",
        )
      ]),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    ProviderManageCity providerManageCity =
        Provider.of<ProviderManageCity>(context, listen: true);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        weatherIcon(context),
        SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(providerManageCity.getactualdescription,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Text(
                    providerManageCity.getActualTemp.truncate().toString() +
                        ' °C',
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
