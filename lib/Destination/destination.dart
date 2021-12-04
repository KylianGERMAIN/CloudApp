import 'package:flutter/material.dart';

class MyDestination extends StatefulWidget {
  const MyDestination({Key? key, required this.destination}) : super(key: key);

  final String destination;

  @override
  MyDestinationState createState() {
    return MyDestinationState();
  }
}

class MyDestinationState extends State<MyDestination> {
  MyDestinationState();

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
    return (
      Container(
        color: Colors.blue,
        height: MediaQuery.of(context).size.height * 0.15,
        child: Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: <Widget>[
                const Icon(Icons.location_on),
                Text(widget.destination)
              ]
            ),
          ),
      )
    );
  }
}
