import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: const Color.fromARGB(255, 167, 37, 27),
            appBarTheme:
                const AppBarTheme(color: Color.fromARGB(255, 167, 37, 27))),
  }
}
