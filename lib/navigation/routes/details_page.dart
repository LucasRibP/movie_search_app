import 'package:flutter/material.dart';
import 'package:movie_search_app/data/movie.dart';
import 'package:movie_search_app/pages/details/details_screen.dart';

class DetailsPage extends Page {
  final Movie movie;

  DetailsPage({required this.movie})
      : super(key: ValueKey("mv:${movie.imdbId}"));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) => DetailsScreen(movie: movie));
  }
}
