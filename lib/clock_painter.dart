/*
 Created by DuocNP on 22/08/2022.
 Copyright (c) 2022 . All rights reserved.
*/
import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final totalDegree = 360;
  final totalTicks = 12;
  final dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    //Translate to between of view
    canvas.translate(size.width / 2, size.height / 2);

    final hourUnitAngle = totalDegree / totalTicks;
    final secUnitAngle = totalDegree / 60;

    //Draw the clock minute hand
    canvas.drawLine(
        Offset.zero,
        Offset.fromDirection( -pi/2 + (dateTime.minute * secUnitAngle).radians, 40),
        Paint()
          ..strokeCap = StrokeCap.round
          ..color = Colors.brown
          ..strokeWidth = 5);

    //Draw the clock hour hand
    canvas.drawLine(
        Offset.zero,
        Offset.fromDirection(-pi/2 + ((dateTime.hour/12 + 1)* hourUnitAngle).radians, 30),
        Paint()
          ..strokeCap = StrokeCap.round
          ..color = Colors.green
          ..strokeWidth = 6);

    //Draw the clock second hand
    canvas.drawLine(
        Offset.zero,
        Offset.fromDirection(-pi/2 + (dateTime.second * secUnitAngle).radians, 60),
        Paint()
          ..strokeCap = StrokeCap.round
          ..color = Colors.blueAccent
          ..strokeWidth = 3);

    //Draw center small circle
    canvas.drawCircle(Offset.zero, 5, Paint()..color = Colors.amber..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
extension on num {
  /// This is an extension we created so we can easily convert a value  /// to a radian value
  double get radians => (this * pi) / 180.0;
}