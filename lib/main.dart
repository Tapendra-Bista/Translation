import 'package:flutter/material.dart';
import 'package:transition/home/home.dart';
import 'package:transition/routes.dart';
import 'package:transition/theme/mytheme.dart';


void main() {
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        darkTheme: myDarkTheme,
        theme: myLightTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        initialRoute: Home.routeName,
        routes: routes);
  }
}
