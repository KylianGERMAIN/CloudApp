import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/ManageCity.dart';
import 'package:weather_icons/weather_icons.dart';

import '../Screens/ChangeDestination.dart';

class MyDestinationBar extends StatefulWidget {
  const MyDestinationBar({Key? key}) : super(key: key);

  @override
  State<MyDestinationBar> createState() => _MyDestinationState();
}

class _MyDestinationState extends State<MyDestinationBar> {
  @override
  void initState() {
    super.initState();
    _manageCity(context, 0);
  }

  void _manageCity(BuildContext context, int city) {
    Provider.of<ProviderManageCity>(context, listen: false).manageCity(city);
  }

  Widget dropdownMenu(BuildContext context, List<String> tbl,
      ProviderManageCity providerManageCity) {
    return SizedBox(
      child: Row(children: <Widget>[
        const Icon(
          Icons.location_on,
          color: Colors.black,
        ),
        Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangeDestination()),
                );
              },
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all<double>(0),
              ),
              label: Text(
                  providerManageCity
                      .getlistCity[providerManageCity.getActualCity!],
                  style: const TextStyle(color: Colors.black, fontSize: 18)),
            )),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ProviderManageCity providerManageCity =
        Provider.of<ProviderManageCity>(context, listen: true);
    List<String> tbl = providerManageCity.getlistCity;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          dropdownMenu(context, tbl, providerManageCity),
        ],
      ),
    );
  }
}
