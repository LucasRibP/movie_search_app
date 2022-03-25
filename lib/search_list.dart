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

  onTapHandler() {
    print("${movie.title} was tapped");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: InkWell(
          splashColor: const Color.fromARGB(255, 167, 37, 27).withAlpha(30),
          onTap: onTapHandler,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Row(
              children: [
                Image.network(
                  movie.poster,
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(movie.year)
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
