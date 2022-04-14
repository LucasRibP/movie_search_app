import 'package:flutter/material.dart';
import 'package:movie_search_app/pages/page_not_found/page_not_found_screen.dart';

class PageNotFoundPage extends Page {
  final void Function() goToHomePage;
  const PageNotFoundPage({required this.goToHomePage})
      : super(key: const ValueKey("404"));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: ((BuildContext context) =>
            PageNotFoundScreen(goToHomePage: goToHomePage)));
  }
}
