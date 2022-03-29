import 'package:flutter/material.dart';
import 'package:movie_search_app/data/movie.dart';
import 'package:movie_search_app/pages/search/search_screen.dart';

class SearchPage extends Page {
  final ValueChanged<Movie> onMovieTap;
  const SearchPage({required this.onMovieTap})
      : super(key: const ValueKey("SearchPage"));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) =>
            SearchScreen(onMovieTap: onMovieTap));
  }
}
