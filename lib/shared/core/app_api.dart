enum AppApi {
  mdbImage,
  movieDatails,
  similarMovies,
}

extension AppApiExtension on AppApi {
  String get getUrl {
    switch (this) {
      case AppApi.mdbImage:
        return 'https://image.tmdb.org/t/p/original/';
      case AppApi.movieDatails:
        return '33?api_key=95f3d1a5d00f3ccfdba9ed69db93744e&language=en-US';
      case AppApi.similarMovies:
        return '33/similar?api_key=95f3d1a5d00f3ccfdba9ed69db93744e&language=en-US&page=1';
    }
  }
}
