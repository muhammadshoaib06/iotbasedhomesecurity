import 'package:flutter/material.dart';
import 'package:iotbasedhomesecurity/Screens/BottomNavBarScreen.dart';
import 'Constants/size_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return HomeScreen();
          },
        );
      },
    );
  }
}