import 'package:flutter/material.dart';
import 'package:movie_search_app/data/movie.dart';

class DetailsScreen extends StatelessWidget {
  final Movie? movie;
  const DetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie?.imdbId ?? ""),
      ),
    );
  }
}
