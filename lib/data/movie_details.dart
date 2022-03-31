class MovieDetails {
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String awards;
  final String poster;
  final Map<String, String> ratings;
  final String metascore;
  final String imdbRating;
  final String imdbVotes;

  const MovieDetails(
      {required this.title,
      required this.year,
      required this.rated,
      required this.released,
      required this.runtime,
      required this.genre,
      required this.director,
      required this.writer,
      required this.actors,
      required this.plot,
      required this.awards,
      required this.poster,
      required this.ratings,
      required this.metascore,
      required this.imdbRating,
      required this.imdbVotes});

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      title: json["Title"],
      year: json["Year"],
      rated: json["Rated"],
      released: json["Released"],
      runtime: json["Runtime"],
      genre: json["Genre"],
      director: json["Director"],
      writer: json["Writer"],
      actors: json["Actors"],
      plot: json["Plot"],
      awards: json["Awards"],
      poster: json["Poster"],
      ratings: {
        for (var element in json["Ratings"]) element["Source"]: element["Value"]
      },
      metascore: json["Metascore"],
      imdbRating: json["imdbRating"],
      imdbVotes: json["imdbVotes"],
    );
  }
}
