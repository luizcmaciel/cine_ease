import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/movies/movies_repository.dart';
import '../../repositories/movies/movies_repository_impl.dart';
import '../../screens/movies/movies_controller.dart';
import '../http/rest_client.dart';
import '../themes/theme_controller.dart';

class ApplicationBind extends StatelessWidget {
  final Widget child;

  const ApplicationBind({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CustomDio>(create: (context) => CustomDio()),
        Provider<MoviesRepository>(create: (context) => MoviesRepositoryImpl(context.read())),
        Provider<ThemeController>(create: (context) => ThemeController()),
        Provider<MoviesController>(create: (context) => MoviesController(context.read())),
      ],
      child: child,
    );
  }
}
