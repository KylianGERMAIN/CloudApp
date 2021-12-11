import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/ManageCity.dart';
import 'Screens/Home.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ProviderManageCity>(
        create: (BuildContext context) => ProviderManageCity())
  ], child: const Home()));
}
