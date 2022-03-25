import "package:flutter/material.dart";
import 'package:movie_search_app/data/movie.dart';

class SearchList extends StatelessWidget {
  final List<Movie> movies;
  const SearchList({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: movies.map((movie) => _SearchListItem(movie: movie)).toList(),
    );
  }
}

class _SearchListItem extends StatelessWidget {
  final Movie movie;
  const _SearchListItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(movie.title);
  }
}
