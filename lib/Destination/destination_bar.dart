import 'package:flutter/material.dart';
import 'destination.dart';

class MyDestinationBar extends StatefulWidget {
  const MyDestinationBar({Key? key}) : super(key: key);

  @override
  State<MyDestinationBar> createState() => _MyDestinationState();
}

class _MyDestinationState extends State<MyDestinationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: MediaQuery.of(context).size.width / 10),
              child: const MyDestination(destination: "Thaiti")),
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: MediaQuery.of(context).size.width / 10),
              child: Container(
                color: Colors.purple,
                height: MediaQuery.of(context).size.height * 0.15,
                child: const Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Icon(Icons.calendar_today_outlined),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
