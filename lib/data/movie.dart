import 'package:flutter/cupertino.dart';

class Movie {
  final String title;
  final String year;
  final String imdbId;
  final String poster;

  const Movie(
      {required this.title,
      required this.year,
      required this.imdbId,
      required this.poster});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        poster: json["Poster"]);
  }
}
