import '../../models/movie.dart';

sealed class MoviesState {}

class MoviesInitialState extends MoviesState {}

class MoviesLoadingState extends MoviesState {}

class MoviesLoadedState extends MoviesState {
  final List<Movie> movies;

  MoviesLoadedState(this.movies);
}

class MoviesErrorState extends MoviesState {
  final String message;

  MoviesErrorState(this.message);
}
