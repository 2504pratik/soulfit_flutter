import 'package:flutter/material.dart';
import 'package:soulfit/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SoulFit',
      home: const HomePage(),
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(233, 234, 236, 1),
      ),
    );
  }
}
