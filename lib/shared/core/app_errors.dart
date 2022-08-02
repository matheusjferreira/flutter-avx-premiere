enum AppErrors {
  notFound,
  serverError,
}

extension AppErrorsExtension on AppErrors {
  String get getMessage {
    switch (this) {
      case AppErrors.notFound:
        return 'Não encontrado.';
      case AppErrors.serverError:
        return 'Serviço indisponível, tente novamente mais tarde.';
    }
  }
}
