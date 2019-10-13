import 'package:flutter/material.dart';
import 'package:music_player_flutter/data/constants/styles.dart' as styles;
import 'package:music_player_flutter/data/constants/data_strings.dart'
    as strings;
import 'package:music_player_flutter/ui/widgets/common.dart' as common;
import 'package:music_player_flutter/ui/widgets/custom_player.dart';

class Player extends StatelessWidget {
  final Brightness brightness;

  Player({this.brightness});

  Widget _appbar() => AppBar(
        brightness: brightness,
        title: Text(
          strings.titlesAppBar['play'],
          style: styles.appBar(brightness),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: styles.colorIcons(brightness),
          iconSize: 20.0,
          onPressed: () {
            //TODO: add forward action
          },
        ),
      );

  Widget _botonIcon({IconData icon, double size, Function function}) {
    return SizedBox(
      width: 75.0,
      height: 75.0,
      child: IconButton(
        icon: Icon(icon, color: styles.colorIcons(brightness), size: size),
        onPressed: function,
      ),
    );
  }

  void _rewindAction() {
    //TODO: add rewind action
  }

  void _playAction() {
    //TODO: add play/pause action
  }

  void _forwardAction() {
    //TODO: add forward action
  }

  Widget _controllersPlayer() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _botonIcon(
              icon: Icons.skip_previous, size: 36.0, function: _rewindAction),
          _botonIcon(
              icon: Icons.play_circle_filled,
              size: 60.0,
              function: _playAction),
          _botonIcon(
              icon: Icons.skip_next, size: 36.0, function: _forwardAction)
        ],
      );

  Widget _playingContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(child: CustomPlayer()),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            'Título de la canción',
            style: styles.title(brightness),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Text('Artista', style: styles.subtitle(brightness)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 4.0,
          ),
          child: _controllersPlayer(),
        )
      ],
    );
  }

  Widget _listNext() {
    return Container();
  }

  Widget _body(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 7,
          child: _playingContainer(),
        ),
        Flexible(
          flex: 2,
          child: _listNext(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles.themeDefault.primary,
      appBar: _appbar(),
      body: _body(context),
    );
  }
}
