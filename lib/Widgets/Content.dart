import 'package:flutter/material.dart';
import 'TemperatureInterface.dart';
import 'package:provider/provider.dart';
import '../Provider/ManageCity.dart';

class MyContent extends StatelessWidget {
  const MyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.54,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Consumer<ProviderManageCity>(
                builder: (BuildContext context,
                        ProviderManageCity providerManageCity,
                        Widget? child) =>
                    const MyTemperatureInterface())],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.34,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[Text("Content")],
          ),
        )
      ],
    );
  }
}
