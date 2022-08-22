/*
 Created by DuocNP on 22/08/2022.
 Copyright (c) 2022 . All rights reserved.
*/
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_custom_painter/clock_painter.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ClockPainter()
    );
  }
}
