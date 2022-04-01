class Movie {
  final String title;
  final String year;
  final String imdbId;
  final String poster;
  final bool hasNoCachedData;

  const Movie(
      {required this.title,
      required this.year,
      required this.imdbId,
      required this.poster,
      this.hasNoCachedData = false});

  const Movie.fromImdbId(this.imdbId)
      : title = "",
        year = "",
        poster = "",
        hasNoCachedData = true;

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        poster: json["Poster"]);
  }
}
