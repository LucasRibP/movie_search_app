import 'package:flutter/material.dart';
import 'package:movie_search_app/search_bar.dart';
import 'package:movie_search_app/search_list.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MovieSearch"),
      ),
      body: Column(
        children: [
          Container(
            child: SearchBar(),
            margin: const EdgeInsets.all(12),
          ),
          SearchList()
        ],
      ),
    );
  }
}
