import 'package:flutter/material.dart';

import '../../models/movie.dart';

class TabBarMovie extends StatelessWidget {
  final Movie movie;

  const TabBarMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Ink(
              height: 45,
              child: const TabBar(
                tabs: [
                  Tab(text: 'Sessões'),
                  Tab(text: 'Detalhes'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 8.0,
                    ),
                    children: [
                      MovieSessions(sessions: movie.sessions),
                    ],
                  ),
                  ListView(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 8.0,
                    ),
                    children: [
                      MovieDetails(synopsis: movie.synopsis),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetails extends StatelessWidget {
  final String synopsis;

  const MovieDetails({
    super.key,
    required this.synopsis,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme) = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'synopsis:',
          style: textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(synopsis),
        ),
      ],
    );
  }
}

class MovieSessions extends StatelessWidget {
  final List<String> sessions;

  const MovieSessions({
    super.key,
    required this.sessions,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: sessions.isEmpty,
      replacement: const Text('Não há sessões disponíveis'),
      child: Center(
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: sessions
              .map((s) => TimeButton(label: s, onPressed: () {}))
              .toList(),
        ),
      ),
    );
  }
}

class TimeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const TimeButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme) = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(8.0),
      onTap: onPressed,
      child: Container(
        width: 62,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: colorScheme.primary),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: colorScheme.primary,
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
