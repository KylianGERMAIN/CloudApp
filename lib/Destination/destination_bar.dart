import 'package:flutter/material.dart';

class MyDestinationBar extends StatefulWidget {
  const MyDestinationBar({Key? key, required this.onPressed}) : super(key: key);
  final Function onPressed;

  @override
  State<MyDestinationBar> createState() => _MyDestinationState();
}

class _MyDestinationState extends State<MyDestinationBar> {
  @override
  void initState() {
    super.initState();
    tbl = ["", "Paris", "Tokyo", "Berlin", "Moscou"];
  }

  @override
  void dispose() {
    super.dispose();
  }

  void change(Object i) {
    widget.onPressed();
    setState(() {
      _value = i;
    });
  }

  Object _value = 1;
  List<String> tbl = [];

  DropdownMenuItem<Object> itemDrowdown(int i) {
    return DropdownMenuItem(
      child: Text(tbl[i]),
      value: i,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: MediaQuery.of(context).size.width / 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Row(children: <Widget>[
                    const Icon(Icons.location_on),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: MediaQuery.of(context).size.width / 20),
                        child: DropdownButton(
                            isDense: true,
                            underline: Container(),
                            value: _value,
                            items: [
                              for (var i = 1; i <= 4; i++) itemDrowdown(i)
                            ],
                            onChanged: (value) {
                              change(value!);
                            })),
                  ]),
                ),
              )),
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: MediaQuery.of(context).size.width / 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Icon(Icons.calendar_today_outlined),
                ),
              )),
        ],
      ),
    );
  }
}
