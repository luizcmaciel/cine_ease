sealed class Either<E extends Exception, S> {}

class Success<E extends Exception, S> implements Either<E, S> {
  final S value;

  Success(this.value);
}

class Failure<E extends Exception, S> implements Either<E, S> {
  final E exception;

  Failure(this.exception);
}
