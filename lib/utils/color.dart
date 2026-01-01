import 'package:flutter/material.dart';

/// Constante pour la gestion des couleurs
abstract class AppColors {
  // Primary brand colors
  static const Color primary = Color(0xFFE85D04);
  static const Color primaryLight = Color(0xFFFFF3E0);
  static const Color primaryDark = Color(0xFFD84315);

  // Background colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text colors
  static const Color textPrimary = Color(0xFF1A1D1E);
  static const Color textSecondary = Color(0xFF6C7278);
  static const Color textTertiary = Color(0xFF9BA0A5);

  // Status colors
  static const Color success = Color(0xFF22C55E);
  static const Color successLight = Color(0xFFDCFCE7);
  static const Color warning = Color(0xFFFBBF24);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color info = Color(0xFF3B82F6);

  // Chart colors
  static const Color chartGreen = Color(0xFF22C55E);
  static const Color chartOrange = Color(0xFFE85D04);
  static const Color chartBackground = Color(0xFFFFEEE6);
  static const Color chartRed = Color(0xFFFF0000);
  static const Color chartGray = Color(0xFFE5E7EB);

  // Efficiency card gradient
  static const Color efficiencyStart = Color(0xFFE86A2C);
  static const Color efficiencyEnd = Color(0xFFF08A4B);

  // Border colors
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderLight = Color(0xFFF3F4F6);
  
  // Conversion Funnel specific
  static const Color funnelAccent = Color(0xFFD4813E);
  static const Color tabBackground = Color(0xFFF5F5F7);


  // Sentiment colors
  static const Color sentimentPositive = Color(0xFF22C55E);
  static const Color sentimentNeutral = Color(0xFFFBBF24);
  static const Color sentimentNegative = Color(0xFFE5E7EB);

  // Navigation
  static const Color navActive = Color(0xFFE85D04);
  static const Color navInactive = Color(0xFF9BA0A5);
}

