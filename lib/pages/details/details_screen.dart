import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_search_app/data/movie.dart';
import 'package:movie_search_app/data/movie_details.dart';
import 'package:http/http.dart' as http;

class DetailsScreen extends StatefulWidget {
  final Movie? movie;
  const DetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String? errorMessage;
  @override
  void initState() {
    fetchMovieDetails();
    super.initState();
  }

  // Keys shouldn't be left visible on public projects, I'm only
  // leaving this one here because it's a free API and there are no
  // repercussions
  final String _omdbKey = "df4ec22f";

  Future<MovieDetails?> fetchMovieDetails() async {
    String? imdbId = widget.movie?.imdbId;
    if (imdbId == null) {
      setState(() {
        errorMessage = "The selected movie has no imdbId";
      });
      return null;
    }

    String query =
        "http://www.omdbapi.com/?apikey=$_omdbKey&i=$imdbId&v=1&plot=full";
    String err = "";
    MovieDetails? movieDetails;

    final response = await http.get(Uri.parse(query));

    try {
      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json["Response"] == "False") {
          err = json["Error"];
        }
        if (json["Response"] == "True") {
          movieDetails = MovieDetails.fromJson(json);
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
    print(movieDetails?.title);
    return movieDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie?.imdbId ?? ""),
      ),
    );
  }
}
