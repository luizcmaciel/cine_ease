import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/themes/theme_controller.dart';
import '../../models/movie.dart';
import '../movie_details/movie_details_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme) = Theme.of(context);
    final themeController = context.read<ThemeController>();

    return Column(
      children: [
        Card(
          child: InkWell(
            onTap: () {
              themeController.changeTheme(movie.genre);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MoviesDetailsScreen(movie: movie),
                ),
              );
            },
            child: FadeInImage(
              height: 250,
              placeholder: const AssetImage('assets/images/loading.gif'),
              placeholderFit: BoxFit.scaleDown,
              image: NetworkImage(movie.imageURI!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          movie.name,
          style: textTheme.titleMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
