import 'package:exam_practic_getx/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/home',

      // Rutes de pàgines emprant GETX
      getPages: [
        GetPage(name: '/home', page: (() => HomeScreen())),
        GetPage(name: '/input', page: (() => InputScreen())),
        GetPage(name: '/detail', page: (() => DetailScreen())),
      ],
    );
  }
}
