import 'package:flutter/material.dart';
import 'package:movie_search_app/pages/search/search_page.dart';

class SearchPage extends Page {
  const SearchPage() : super(key: const ValueKey("SearchPage"));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) => const SearchScreen());
  }
}
