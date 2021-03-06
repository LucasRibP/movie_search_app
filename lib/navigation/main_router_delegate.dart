import 'package:flutter/material.dart';
import 'package:movie_search_app/data/movie.dart';
import 'package:movie_search_app/navigation/main_path.dart';
import 'package:movie_search_app/navigation/routes/details_page.dart';
import 'package:movie_search_app/navigation/routes/page_not_found_page.dart';
import 'package:movie_search_app/navigation/routes/search_page.dart';

class MainRouterDelegate extends RouterDelegate<MainPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MainPath> {
  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  MainRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  Movie? _selectedMovie;
  Movie? get selectedMovie => _selectedMovie;
  set selectedMovie(Movie? value) {
    _selectedMovie = value;
    notifyListeners();
  }

  bool _show404 = false;
  bool get show404 => _show404;
  set show404(bool value) {
    _show404 = value;
    notifyListeners();
  }

  @override
  MainPath get currentConfiguration =>
      MainPath(imdbId: selectedMovie?.imdbId, isUnknown: show404);

  onMovieTap(Movie movie) {
    selectedMovie = movie;
  }

  goToHomePage() {
    selectedMovie = null;
    show404 = false;
  }

  @override
  Widget build(BuildContext context) {
    Movie? curSelectedMovie = selectedMovie;
    return Navigator(
      key: navigatorKey,
      pages: show404
          ? [PageNotFoundPage(goToHomePage: goToHomePage)]
          : [
              SearchPage(onMovieTap: onMovieTap),
              if (curSelectedMovie != null) DetailsPage(movie: curSelectedMovie)
            ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        selectedMovie = null;
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(MainPath configuration) async {
    if (configuration.isHomePage) {
      show404 = false;
      selectedMovie = null;
    } else if (configuration.isDetailsPage) {
      show404 = false;
      selectedMovie = Movie.fromImdbId(configuration.imdbId ?? "");
    } else if (configuration.isUnknownPage) {
      show404 = true;
    }
    return;
  }
}
