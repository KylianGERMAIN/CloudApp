import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/ManageCity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Screens/Home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ProviderManageCity>(
        create: (BuildContext context) => ProviderManageCity())
  ], child: const Home()));
}
