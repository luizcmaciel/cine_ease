import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../models/movie.dart';

abstract interface class MoviesRepository {
  Future<Either<RepositoryException, List<Movie>>> fetchMovies();

  Future<Either<RepositoryException, List<Movie>>> fetchMoviesByGenre(String genre);
}
