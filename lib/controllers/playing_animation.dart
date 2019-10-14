
import 'package:flutter/widgets.dart';

class PlayingController extends ChangeNotifier{

  final TickerProvider vsync;
  final AnimationController _animationController;
  PlayerState state = PlayerState.play;

  PlayingController({this.vsync,int duration})
  :_animationController = AnimationController(vsync: vsync){
    _animationController
    ..duration = Duration(seconds: duration)
    ..addListener((){
      notifyListeners();
    })
    ..addStatusListener((AnimationStatus status){
      //TODO: add events

      notifyListeners();
    });
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  get value => _animationController.value;

}

enum PlayerState{
  play,
  pause,
  forward10,
  rewind10,
}
