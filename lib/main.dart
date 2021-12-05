import 'dart:developer';

import 'package:flutter/material.dart';
import 'Destination/destination_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  onCalledFromOutside() {
    log("Call from outside");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            MyDestinationBar(onPressed: onCalledFromOutside,),
            Container(
              color: Colors.orange,
              height: MediaQuery.of(context).size.height * 0.88,
              width: MediaQuery.of(context).size.width * 1,
              child: const Text("Hello world"),
              )
          ],
        ),
      ),
    );
  }
}
