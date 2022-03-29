class MainPath {
  final String? imdbId;
  final bool isUnknown;

  MainPath.home()
      : imdbId = null,
        isUnknown = false;

  MainPath.details(this.imdbId) : isUnknown = false;

  MainPath.unknown()
      : imdbId = null,
        isUnknown = true;

  bool get isHomePage => imdbId == null && isUnknown == false;
  bool get isDetailsPage => imdbId != null && isUnknown == false;
  bool get isUnknownPage => isUnknown == true;
}
