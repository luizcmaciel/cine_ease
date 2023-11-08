import 'package:flutter/material.dart';

import '../../models/movie.dart';
import 'parental_rating.dart';

class PosterCard extends StatelessWidget {
  final Movie movie;

  const PosterCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme) = Theme.of(context);
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          height: MediaQuery.sizeOf(context).height / 2.5,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(16.0),
            ),
            image: DecorationImage(
              image: NetworkImage(movie.imageURI!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 120,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.name,
                    style: textTheme.titleLarge,
                  ),
                  Text(
                    movie.genre,
                    style: textTheme.bodyLarge,
                  ),
                  Row(
                    children: [
                      ParentalRating(
                        classification: movie.classification,
                      ),
                      Text(
                        movie.duration,
                        style: textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
