import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/themes/theme_controller.dart';
import '../../models/movie.dart';
import '../components/movie_card.dart';
import 'movies_controller.dart';
import 'movies_state.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  static final List<String> genres = [
    'Todos',
    'Ação',
    'Comédia',
    'Drama',
    'Romance',
    'Documentário',
    'Suspense',
    'Terror',
    'Ficção Científica'
  ];

  late final MoviesController moviesController;
  late final ThemeController themeController;

  @override
  void initState() {
    moviesController = context.read<MoviesController>();
    themeController = context.read<ThemeController>();
    moviesController.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme) = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: const Text('Cine Ease Bilheteria'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => genres
                .map((e) => PopupMenuItem(value: e, child: Text(e)))
                .toList(),
            onSelected: (genre) {
              themeController.changeTheme(genre);
              (genre == 'Todos')
                  ? moviesController.getMovies()
                  : moviesController.getMoviesByGenre(genre);
            },
          ),
        ],
      ),
      body: BlocBuilder<MoviesController, MoviesState>(
        builder: (context, state) {
          return switch (state) {
            MoviesInitialState() => const SizedBox.shrink(),
            MoviesLoadingState() => const MoviesLoading(),
            MoviesLoadedState(:final movies) => MoviesLoaded(movies: movies),
            MoviesErrorState(:final message) => MoviesError(message: message),
          };
        },
      ),
    );
  }
}

class MoviesLoading extends StatelessWidget {
  const MoviesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class MoviesLoaded extends StatelessWidget {
  final List<Movie> movies;

  const MoviesLoaded({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme) = Theme.of(context);
    if (movies.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'Não há filmes para essa categoria',
            style: textTheme.titleMedium,
          ),
        ),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisExtent: 300,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) => MovieCard(movie: movies[index]),
    );
  }
}

class MoviesError extends StatelessWidget {
  final String message;

  const MoviesError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme) = Theme.of(context);
    return Center(
      child: Text(
        message,
        style: textTheme.titleLarge,
      ),
    );
  }
}
