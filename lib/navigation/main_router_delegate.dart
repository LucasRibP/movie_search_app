import 'package:flutter/material.dart';
import 'package:movie_search_app/data/movie.dart';
import 'package:movie_search_app/navigation/main_path.dart';
import 'package:movie_search_app/navigation/routes/details_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const SearchPage(),
        if (selectedMovie != null) DetailsPage(movie: selectedMovie)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        selectedMovie = null;
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
