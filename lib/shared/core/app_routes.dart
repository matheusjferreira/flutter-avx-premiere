enum AppRoutes {
  home,
}

extension AppRoutesExtension on AppRoutes {
  String get getRoute {
    switch (this) {
      case AppRoutes.home:
        return '/';
    }
  }
}
