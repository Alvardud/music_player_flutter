import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_player_flutter/ui/pages/player.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      home: Player(brightness: Brightness.dark,),
    );
  }
}
