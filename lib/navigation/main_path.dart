class MainPath {
  final String? imdbId;
  final bool isUnknown;

  MainPath({required this.imdbId, required this.isUnknown});

  MainPath.home()
      : imdbId = null,
        isUnknown = false;

  MainPath.details(this.imdbId) : isUnknown = false;

  MainPath.unknown()
      : imdbId = null,
        isUnknown = true;

  bool get isHomePage => imdbId == null && !isUnknown;
  bool get isDetailsPage => imdbId != null && !isUnknown;
  bool get isUnknownPage => isUnknown;
}
