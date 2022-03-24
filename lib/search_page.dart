import 'package:flutter/material.dart';
import 'package:movie_search_app/search_bar.dart';
import 'package:movie_search_app/search_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchTerm = "";
  void onSearchBarTextChange(String text) {
    setState(() {
      searchTerm = text;
    });
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
            child: SearchBar(onTextChange: onSearchBarTextChange),
            margin: const EdgeInsets.all(12),
          ),
          SearchList()
        ],
      ),
    );
  }
}
