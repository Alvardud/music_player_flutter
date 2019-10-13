import 'package:flutter/material.dart';

Color _convertColor(String x) {
  return Color(int.parse(x.substring(1, 7), radix: 16) + 0xFF000000);
}

class CustomTheme {
  Color primary;
  Color secundary;
  Color accent;
  Color tertiary;
  Color neutral;

  CustomTheme({this.accent,this.neutral,this.primary,this.secundary,this.tertiary});

  factory CustomTheme.fromData({String primary,
      String secundary,
      String accent,
      String tertiary,
      String neutral}){
        return CustomTheme(
          accent: _convertColor(accent),
          primary: _convertColor(primary),
          neutral: _convertColor(neutral),
          secundary: _convertColor(secundary),
          tertiary: _convertColor(tertiary)
        );
      }

  factory CustomTheme.fromdefault(){
        return CustomTheme(
          primary: _convertColor("#261F20"),
          accent: _convertColor("#403538"),
          secundary: _convertColor("#A6A4A4"),
          tertiary: _convertColor("#0D0000"),
          neutral: _convertColor("#F2F2F2"),
        );
      }
}