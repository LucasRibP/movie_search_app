import 'package:flutter/material.dart';
import 'package:movie_search_app/search_bar.dart';
import 'package:movie_search_app/search_list.dart';
import "dart:async";

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Timer? _debounceMovieSearch;

  // Keys shouldn't be left visible on public projects, I'm only
  // leaving this one here because it's a free API and there are no
  // repercussions
  final String _omdbKey = "df4ec22f";

  void _onSearchBarTextChange(String text) {
    if (_debounceMovieSearch?.isActive ?? false) _debounceMovieSearch?.cancel();
    _debounceMovieSearch = Timer(const Duration(milliseconds: 500), () {
      requestMovieSearch(text);
    });
  }

  void requestMovieSearch(String searchQuery) {
    String query =
        "http://www.omdbapi.com/?apikey=$_omdbKey&s=$searchQuery&type=movie";
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
          SearchList()
        ],
      ),
    );
  }
}
