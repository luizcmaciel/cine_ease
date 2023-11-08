import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

class ThemeController extends Cubit<ThemeData> {
  ThemeController() : super(ThemeConfig.getTheme('default'));

  void changeTheme(String genre) => emit(ThemeConfig.getTheme(genre));
}
