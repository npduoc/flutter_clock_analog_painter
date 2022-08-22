/*
 Created by DuocNP on 22/08/2022.
 Copyright (c) 2022 . All rights reserved.
*/
import 'dart:math';

import 'package:flutter/material.dart';

class ClockFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);

    canvas.drawCircle(
        Offset.zero,
        90,
        Paint()
          ..color = Colors.amber
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4);

    const hourUnitAngle = 30; // 360 / 12 = 30

    //Draw points of hour
    for (var i = 0; i < 12; i++) {
      var currAngle = -pi/2 + (hourUnitAngle * i).radians;
      canvas.drawLine(
          Offset.fromDirection(currAngle, i % 3 == 0 ? 65 : 75), // i = 0, 3, 6, 9 => longer line
          Offset.fromDirection(currAngle, 80),
          Paint()
            ..color = Colors.amber
            ..strokeWidth = 4
            ..strokeCap = StrokeCap.round);

      //Draw hour text
      var number = (i == 0 ? 12 : i).toString();
      var textPainter = TextPainter(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: number,
          style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)
        ),
        textDirection: TextDirection.ltr
      );
      textPainter.layout(minWidth: 10, maxWidth: 40);
      var textOffset = Offset.fromDirection(currAngle - 5.radians, 120); //subtract to set text position properly
      textPainter.paint(canvas, textOffset);
    }
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
