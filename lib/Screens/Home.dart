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
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(108, 172, 199, 1),
            Color.fromRGBO(183, 229, 247, 1),
          ],
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Consumer<ProviderManageCity>(
                  builder: (BuildContext context,
                          ProviderManageCity providerManageCity,
                          Widget? child) =>
                      const MyDestinationBar())),
          body: Container(
            child: Column(
              children: <Widget>[
                Consumer<ProviderManageCity>(
                    builder: (BuildContext context,
                            ProviderManageCity providerManageCity,
                            Widget? child) =>
                        const MyContent())
              ],
            ),
          ),
        ));
  }
}
