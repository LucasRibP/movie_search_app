import "package:flutter/material.dart";
import 'package:movie_search_app/components/image_not_found.dart';
import 'package:movie_search_app/data/movie.dart';

class SearchList extends StatefulWidget {
  final List<Movie> initialMovies;
  final ValueChanged<Movie> onMovieTap;
  final Future<List<Movie>> Function(int) requestMoreMoviesIfPossible;

  const SearchList(
      {Key? key,
      required this.initialMovies,
      required this.onMovieTap,
      required this.requestMoreMoviesIfPossible})
      : super(key: key);

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  bool noMoreMoviesAvaliable = false;
  int curResultPage = 1;
  late List<Movie> curMovieList;

  @override
  void initState() {
    curMovieList = widget.initialMovies;
    super.initState();
  }

  void requestMoreMovies() async {
    List<Movie> newMovies =
        await widget.requestMoreMoviesIfPossible(curResultPage + 1);
    if (newMovies.isEmpty) {
      setState(() {
        noMoreMoviesAvaliable = true;
      });
    }
    setState(() {
      curResultPage++;
      curMovieList += newMovies;
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemCount =
        noMoreMoviesAvaliable ? curMovieList.length : curMovieList.length + 1;

    return ListView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        if (index < curMovieList.length) {
          return _SearchListItem(
            movie: curMovieList[index],
            onTap: () => widget.onMovieTap(curMovieList[index]),
          );
        } else {
          if (!noMoreMoviesAvaliable) {
            requestMoreMovies();
          }
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _SearchListItem extends StatelessWidget {
  final Movie movie;
  final void Function() onTap;
  const _SearchListItem({Key? key, required this.movie, required this.onTap})
      : super(key: key);

  Widget _getThumbnail() {
    return Image.network(
      movie.poster,
      fit: BoxFit.fill,
      height: 50,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return const ImageNotFound(
          width: 35,
          height: 50,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: InkWell(
          splashColor: const Color.fromARGB(255, 167, 37, 27).withAlpha(30),
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Row(
              children: [
                _getThumbnail(),
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
