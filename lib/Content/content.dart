import 'package:flutter/material.dart';
import 'temperature_interface.dart';

class MyContent extends StatefulWidget {
  const MyContent({Key? key}) : super(key: key);

  @override
  State<MyContent> createState() => _MyContentState();
}

class _MyContentState extends State<MyContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        Container(
          color: Colors.orange,
          height: MediaQuery.of(context).size.height * 0.54,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[MyTemperatureInterface()],
          ),
        ),
        Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height * 0.34,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Hello world"),
            ],
          ),
        )
      ],
    ));
  }
}
