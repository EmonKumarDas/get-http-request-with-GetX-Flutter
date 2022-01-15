import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_statemanagment_covidapi/display/display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Covidpage(),
      getPages: [
        GetPage(
          name: "/home",
          page: () => Covidpage(),
        )
      ],
    );
  }
}
