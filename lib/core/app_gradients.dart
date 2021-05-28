import 'dart:math';
import 'package:flutter/material.dart';

class AppGradients{
  static final Gradient background = LinearGradient(
      colors: [
        Color(0xFF40B38C),
        Color(0xFF45CC93)
      ],
      transform: GradientRotation(2.35619 * pi)
  );
}