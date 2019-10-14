import 'package:flutter/material.dart';
import 'package:music_player_flutter/data/constants/styles.dart' as styles;
import 'package:music_player_flutter/data/constants/data_strings.dart'
    as strings;
import 'package:music_player_flutter/ui/widgets/common.dart' as common;
import 'package:music_player_flutter/ui/widgets/custom_player.dart';
import 'package:music_player_flutter/utils/rules.dart' as rules;

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
        actions: <Widget>[_botonIcon(icon: Icons.more_vert, function: () {})],
        leading: _botonIcon(icon: Icons.arrow_back_ios, function: () {}),
      );

  Widget _botonIcon({IconData icon, double size = 20, Function function}) {
    return SizedBox(
      width: 70.0,
      height: 70.0,
      child: IconButton(
        icon: Icon(icon, color: styles.colorIcons(brightness), size: size),
        onPressed: function,
      ),
    );
  }

  Widget _controllersPlayer() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _botonIcon(icon: Icons.repeat, function: rules.repeat, size: 24.0),
          _botonIcon(
              icon: Icons.skip_previous,
              size: 36.0,
              function: rules.rewindAction),
          _botonIcon(
              icon: Icons.play_circle_filled,
              size: 54.0,
              function: rules.playAction),
          _botonIcon(
              icon: Icons.skip_next, size: 36.0, function: rules.forwardAction),
          _botonIcon(
              icon: Icons.playlist_add, function: rules.addPlayList, size: 28.0)
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
