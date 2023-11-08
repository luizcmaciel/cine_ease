import 'package:flutter/material.dart';

import '../../models/movie.dart';
import '../components/poster_card.dart';
import '../components/tab_bar_movie.dart';

class MoviesDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MoviesDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PosterCard(movie: movie),
          ),
          Expanded(
            child: TabBarMovie(movie: movie),
          ),
        ],
      ),
    );
  }
}
