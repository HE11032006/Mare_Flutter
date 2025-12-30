// lib/widget/cards/customer_sentiment_gauge.dart
import 'dart:math';
import 'package:flutter/material.dart';

class CustomerSentimentGauge extends CustomPainter {
  final double positive;
  final double neutral;
  final double negative;

  CustomerSentimentGauge({
    required this.positive,
    required this.neutral,
    required this.negative,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;
    const int totalTicks = 60; 
    final double tickLength = 15.0;

    const colorPos = Color(0xFFD4813E);
    const colorNeu = Color(0xFFE5B58B);
    const colorNeg = Color(0xFFB0B8C1);

    // 1. On calcule la somme actuelle
    double currentSum = positive + neutral + negative;
    
    // 2. Sécurité : si la somme est 0, on met une valeur par défaut pour éviter la division par 0
    double factor = currentSum > 0 ? currentSum : 1.0;

    // 3. On calcule les seuils proportionnels pour remplir TOUTE la jauge (normalisation)
    // Même si la somme est < 1, ces nouveaux seuils iront jusqu'à 1.0
    double thresholdPos = positive / factor;
    double thresholdNeu = (positive + neutral) / factor;

    for (int i = 0; i <= totalTicks; i++) {
      final double angle = pi + (i / totalTicks) * pi;
      final double progress = i / totalTicks;

      Color tickColor;
      
      if (progress <= thresholdPos) {
        tickColor = colorPos;
      } else if (progress <= thresholdNeu) {
        tickColor = colorNeu;
      } else {
        // Le reste remplit obligatoirement la jauge jusqu'à la fin
        tickColor = colorNeg;
      }

      final Paint paint = Paint()
        ..color = tickColor
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round;

      final Offset start = Offset(
        center.dx + (radius - tickLength) * cos(angle),
        center.dy + (radius - tickLength) * sin(angle),
      );
      final Offset end = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomerSentimentGauge oldDelegate) {
    return oldDelegate.positive != positive || 
           oldDelegate.neutral != neutral || 
           oldDelegate.negative != negative;
  }
}