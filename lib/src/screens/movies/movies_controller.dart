import 'package:bloc/bloc.dart';

import '../../core/fp/either.dart';
import '../../repositories/movies/movies_repository.dart';
import 'movies_state.dart';

class MoviesController extends Cubit<MoviesState> {
  final MoviesRepository _moviesRepository;

  MoviesController(this._moviesRepository) : super(MoviesInitialState());

  Future<void> getMovies() async {
    emit(MoviesLoadingState());
    final result = await _moviesRepository.fetchMovies();
    return switch (result) {
      Success(value: final movies) => emit(MoviesLoadedState(movies)),
      Failure(exception: final e) => emit(MoviesErrorState(e.message)),
    };
  }

  Future<void> getMoviesByGenre(String genre) async {
    emit(MoviesLoadingState());
    final result = await _moviesRepository.fetchMoviesByGenre(genre);
    return switch (result) {
      Success(value: final movies) => emit(MoviesLoadedState(movies)),
      Failure(exception: final e) => emit(MoviesErrorState(e.message)),
    };
  }
}
