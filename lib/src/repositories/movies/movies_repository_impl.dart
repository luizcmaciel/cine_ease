import 'dart:convert';
import 'dart:developer';

import 'package:cine_ease/src/core/http/rest_client.dart';
import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../models/movie.dart';
import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final CustomDio dio;

  const MoviesRepositoryImpl(this.dio);
  
  @override
  Future<Either<RepositoryException, List<Movie>>> fetchMovies() async {
    try {
      final Response(:data) = await dio.get('/movies.json');
      final json = jsonDecode(data);
      final movies = List<Movie>.from(json.map((e) => Movie.fromMap(e)));
      return Success(movies);
    } on DioException catch (e, s) {
      log('Falha ao buscar a lista de filmes', error: e, stackTrace: s);
      return Failure(RepositoryError('Falha ao buscar a lista de filmes'));
    }
  }

  @override
  Future<Either<RepositoryException, List<Movie>>> fetchMoviesByGenre(String genre) async {
    try {
      final Response(:data) = await dio.get('/movies.json');
      final json = jsonDecode(data);
      final result = List<Movie>.from(json.map((e) => Movie.fromMap(e)));
      final movies = result.where((e) => e.genre == genre).toList();
      return Success(movies);
    } on DioException catch (e, s) {
      log('Falha ao buscar a lista de filmes', error: e, stackTrace: s);
      return Failure(RepositoryError('Falha ao buscar a lista de filmes'));
    }
  }
}
