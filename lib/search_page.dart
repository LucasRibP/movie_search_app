import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_search_app/data/movie.dart';
import 'package:movie_search_app/search_bar.dart';
import 'package:movie_search_app/search_list.dart';
import "dart:async";
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String errorMessage = "";
  String curSearchQuery = "";
  Timer? _debounceMovieSearch;
  Future<List<Movie>>? movieList;

  // Keys shouldn't be left visible on public projects, I'm only
  // leaving this one here because it's a free API and there are no
  // repercussions
  final String _omdbKey = "df4ec22f";

  void _onSearchBarTextChange(String text) {
    if (_debounceMovieSearch?.isActive ?? false) _debounceMovieSearch?.cancel();
    _debounceMovieSearch = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        movieList = fetchMovieSearch(text);
        curSearchQuery = text;
      });
    });
  }

  Future<List<Movie>> fetchMovieSearch(String searchQuery) async {
    String query =
        "http://www.omdbapi.com/?apikey=$_omdbKey&s=$searchQuery&type=movie";
    String err = "";
    List<Movie> movieList = [];

    final response = await http.get(Uri.parse(query));

    try {
      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json["Response"] == "False") {
          err = json["Error"];
        }
        if (json["Response"] == "True") {
          List results = json["Search"];
          movieList = results
              .map((movie) => Movie.fromJson(movie))
              .toList(growable: false);
        }
      } else {
        err =
            "Your search results were not received - Status code: ${response.statusCode} :(";
      }
    } catch (e) {
      err = "Error decoding server response - $e";
    }

    setState(() {
      errorMessage = err;
    });
    return movieList;
  }

  @override
  void dispose() {
    _debounceMovieSearch?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MovieSearch"),
      ),
      body: Column(
        children: [
          Container(
            child: SearchBar(onTextChange: _onSearchBarTextChange),
            margin: const EdgeInsets.all(12),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: (curSearchQuery.isEmpty)
                  ? const Text("Search for something!")
                  : FutureBuilder(
                      future: movieList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Movie> movies = snapshot.data as List<Movie>;
                          if (movies.isEmpty) {
                            return Text(errorMessage);
                          } else {
                            return SearchList(movies: movies);
                          }
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }))
        ],
      ),
    );
  }
}
