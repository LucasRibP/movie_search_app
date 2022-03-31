import 'package:flutter/material.dart';
import 'package:movie_search_app/navigation/main_router_delegate.dart';
import 'package:movie_search_app/navigation/main_router_parser.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MainRouterDelegate delegate = MainRouterDelegate();
  MainRouterParser parser = MainRouterParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 167, 37, 27),
          appBarTheme:
              const AppBarTheme(color: Color.fromARGB(255, 167, 37, 27))),
      routerDelegate: delegate,
      routeInformationParser: parser,
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}
