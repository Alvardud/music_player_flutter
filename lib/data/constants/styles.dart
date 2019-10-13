import 'package:flutter/widgets.dart';
import 'package:music_player_flutter/models/custom_theme.dart';
import 'package:flutter/material.dart';

CustomTheme themeDefault = CustomTheme.fromdefault();

TextStyle appBar(Brightness brightness) => TextStyle(
      color: brightness.toString() == 'Brightness.dark'
          ? Colors.white
          : Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );

Color colorIcons(Brightness brightness) =>
    brightness.toString() == 'Brightness.dark' ? Colors.white : Colors.black;

TextStyle title(Brightness brightness) => TextStyle(
      color: brightness.toString() == 'Brightness.dark'
          ? Colors.white
          : Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );

TextStyle subtitle(Brightness brightness) => TextStyle(
      color: brightness.toString() == 'Brightness.dark'
          ? Colors.grey[400]
          : Colors.grey[600],
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );
