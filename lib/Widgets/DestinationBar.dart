import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/ManageCity.dart';

class MyDestinationBar extends StatefulWidget {
  const MyDestinationBar({Key? key}) : super(key: key);

  @override
  State<MyDestinationBar> createState() => _MyDestinationState();
}

class _MyDestinationState extends State<MyDestinationBar> {
  Object _value = 1;
  List<String> tbl = [];

  @override
  void initState() {
    super.initState();
    tbl = ["", "Paris", "Tokyo", "Berlin", "Moscou"];
  }

  void _manageCity(BuildContext context, Object city) {
    Provider.of<ProviderManageCity>(context, listen: false).manageCity(city);
  }

  void change(Object i) {
    _manageCity(context, i);
    setState(() {
      _value = i;
    });
  }

  Widget dropdownMenu(BuildContext context) {
    DropdownMenuItem<Object> itemDrowdown(int i) {
      return DropdownMenuItem(
        child:
            Text(tbl[i], style: const TextStyle(fontWeight: FontWeight.bold)),
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
                  child: DropdownButton(
                      isDense: true,
                      underline: Container(),
                      value: _value,
                      items: [for (var i = 1; i <= 4; i++) itemDrowdown(i)],
                      onChanged: (value) {
                        change(value!);
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
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          dropdownMenu(context),
          calendar(context),
        ],
      ),
    );
  }
}
