import 'package:flutter/material.dart';
import 'package:music_player_flutter/data/constants/styles.dart' as styles;
import 'dart:math' as math;

class CustomPlayer extends StatelessWidget {
  Widget _portadaDisco({String portada = null}) {
    return Container(
      height: 180.0,
      width: 180.0,
      decoration: BoxDecoration(
          color: styles.themeDefault.secundary.withOpacity(0.4),
          borderRadius: BorderRadius.circular(100.0)),
      child: portada != null
          ? Image.asset(
              portada,
              fit: BoxFit.cover,
            )
          : Icon(
              Icons.music_note,
              size: 100.0,
              color: styles.themeDefault.neutral,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: ControllerTime(),
            ),
            Align(
              alignment: Alignment.center,
              child: _portadaDisco(),
            ),
          ],
        ),
      ),
    );
  }
}

class ControllerTime extends StatefulWidget {
  @override
  _ControllerTimeState createState() => _ControllerTimeState();
}

class _ControllerTimeState extends State<ControllerTime> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blueAccent,
      height: 280.0,
      width: 280.0,
      child: CustomPaint(
        painter: ControllerPainter(value: 0.4),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "11:30",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "49:30",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ControllerPainter extends CustomPainter {
  double value;
  ControllerPainter({this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final rect1 = Rect.fromLTRB(20, 45, 260, 265);
    final startAngle1 = math.pi;
    final sweepAngle1 = -math.pi;
    final useCenter1 = false;
    final paint1 = Paint()
      ..color = styles.themeDefault.secundary.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawArc(rect1, startAngle1, sweepAngle1, useCenter1, paint1);

    final rect2 = Rect.fromLTRB(20, 45, 260, 265);
    final startAngle2 = math.pi;
    final sweepAngle2 = -math.pi * (value);
    final useCenter2 = false;
    final paint2 = Paint()
      ..color = styles.themeDefault.secundary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    canvas.drawArc(rect2, startAngle2, sweepAngle2, useCenter2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
