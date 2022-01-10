import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/ManageCity.dart';
import 'package:weather_icons/weather_icons.dart';


class MyDestinationBar extends StatefulWidget {
  const MyDestinationBar({Key? key}) : super(key: key);

  @override
  State<MyDestinationBar> createState() => _MyDestinationState();
}

class _MyDestinationState extends State<MyDestinationBar> {
  int? _value = 1;

  @override
  void initState() {
    super.initState();
  }

  void _manageCity(BuildContext context, int city) {
    Provider.of<ProviderManageCity>(context, listen: false).manageCity(city);
  }

  void change(int? city) {
    _manageCity(context, city!);
    setState(() {
      _value = city;
    });
  }

  Widget dropdownMenu(BuildContext context, List<String> tbl, ProviderManageCity providerManageCity) {
    DropdownMenuItem<int> itemDrowdown(int? i) {
      return DropdownMenuItem(
        child:
            Text(tbl[i!], style: const TextStyle(fontWeight: FontWeight.bold)),
        value: i,
      );
    }

    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Row(children: <Widget>[
              const Icon(Icons.location_on),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: MediaQuery.of(context).size.width / 20),
                  child: DropdownButton<int>(
                      isDense: true,
                      underline: Container(),
                      value: _value,
                      items: [for (var i = 0; i < providerManageCity.getlistCity.length; i++) itemDrowdown(i)],
                      onChanged: (int? value) {
                        change(value);
                      })),
            ]),
          ),
        ));
  }

  Widget calendar(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          child: const Align(
            alignment: Alignment.bottomLeft,
            child: Icon(Icons.calendar_today_outlined),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {


    
    final ProviderManageCity providerManageCity = Provider.of<ProviderManageCity>(context, listen: false);
    List<String> tbl = providerManageCity.getlistCity;

    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          dropdownMenu(context, tbl, providerManageCity),
          calendar(context),
        ],
      ),
    );
  }
}
