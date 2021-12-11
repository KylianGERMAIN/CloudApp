import 'dart:developer';
import 'package:flutter/material.dart';
import '../Widgets/DestinationBar.dart';
import '../Widgets/Content.dart';
import 'package:provider/provider.dart';
import '../Provider/ManageCity.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[
                MultiProvider(providers: [
                  ChangeNotifierProvider<ProviderManageCity>(
                      create: (BuildContext context) => ProviderManageCity())
                ], child: const MyDestinationBar()),
                MultiProvider(providers: [
                  ChangeNotifierProvider<ProviderManageCity>(
                      create: (BuildContext context) => ProviderManageCity())
                ], child: const MyContent())
              ],
            ),
          ),
        ));
  }
}
