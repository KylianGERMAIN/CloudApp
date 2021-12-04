import 'package:flutter/material.dart';


class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);


  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: MediaQuery.of(context).size.height * 0.15,
                child: const Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('Left'),
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                height: MediaQuery.of(context).size.height * 0.15,
                child: const Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text('Bottom'),
                  ),
                ),
              ),
              Container(
                color: Colors.purple,
                height: MediaQuery.of(context).size.height * 0.15,
                child: const Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('Right'),
                  ),
                ),
              )
            ],
      ),
    );
  }
}
