sealed class RepositoryException implements Exception {
  final String message;

  RepositoryException(this.message);
}

class RepositoryError extends RepositoryException {
  RepositoryError(super.message);
}
