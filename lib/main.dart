import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/navigation/nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie App',
      initialRoute: Nav.initial,
      getPages: Nav.routes,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
