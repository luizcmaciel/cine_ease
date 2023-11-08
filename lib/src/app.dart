import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/provider/application_bind.dart';
import 'core/themes/theme_controller.dart';
import 'screens/movies/movies_screen.dart';

class CineEaseApp extends StatelessWidget {
  const CineEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBind(
      child: BlocBuilder<ThemeController, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Cine Ease',
            theme: state,
            home: const MoviesScreen(),
          );
        },
      ),
    );
  }
}
