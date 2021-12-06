import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyTemperatureInterface extends StatefulWidget {
  const MyTemperatureInterface({Key? key}) : super(key: key);

  @override
  State<MyTemperatureInterface> createState() => _MyTemperatureInterfaceState();
}

class _MyTemperatureInterfaceState extends State<MyTemperatureInterface> {
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
      Column(
        children: [
          Container(
            color: Colors.brown,
            height: MediaQuery.of(context).size.height * 0.27,
            width: MediaQuery.of(context).size.width * 1,
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[SvgPicture.network('https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg'),],
            ),
          ),
          Container(
            color: Colors.orange,
            height: MediaQuery.of(context).size.height * 0.27,
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[const Text("Hello world"),],
            ),
          )
        ],
      )
    );
  }
}
