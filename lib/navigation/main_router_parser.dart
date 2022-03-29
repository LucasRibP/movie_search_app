import 'package:flutter/cupertino.dart';
import 'package:movie_search_app/navigation/main_path.dart';

class MainRouterParser extends RouteInformationParser<MainPath> {
  @override
  Future<MainPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? "/");

    if (uri.pathSegments.isEmpty) return MainPath.home();

    if (uri.pathSegments.length == 1) {
      final first = uri.pathSegments[0].toLowerCase();

      if (first == "home") return MainPath.home();
      return MainPath.unknown();
    }

    if (uri.pathSegments.length == 2) {
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();

      if (first == "movie") return MainPath.details(second);
      return MainPath.unknown();
    }
    return MainPath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(MainPath configuration) {
    if (configuration.isHomePage) {
      return const RouteInformation(location: "/");
    }
    if (configuration.isDetailsPage) {
      return RouteInformation(location: "/movie/${configuration.imdbId}");
    }
    if (configuration.isUnknownPage) {
      return const RouteInformation(location: "/404");
    }
    return null;
  }
}
