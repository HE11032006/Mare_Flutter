import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';

/// Application pour la gestion des texte

abstract class AppTextStyles {
  static TextStyle get _baseFont => GoogleFonts.inter();

  // Headings
  static TextStyle heading1 = _baseFont.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle heading2 = _baseFont.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle heading3 = _baseFont.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle heading4 = _baseFont.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle headingLarge = _baseFont.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle headingMedium = _baseFont.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  // Card titles
  static TextStyle cardTitle = _baseFont.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static TextStyle cardSubtitle = _baseFont.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  // Body text
  static TextStyle bodyLarge = _baseFont.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static TextStyle bodyMedium = _baseFont.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static TextStyle bodySmall = _baseFont.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Metrics and numbers
  static TextStyle metricLarge = _baseFont.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle metricMedium = _baseFont.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle metricSmall = _baseFont.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  // Labels
  static TextStyle label = _baseFont.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static TextStyle labelSmall = _baseFont.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.textTertiary,
    height: 1.4,
  );

  static TextStyle labelMedium = _baseFont.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static TextStyle labelLarge = _baseFont.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // Percentage badges
  static TextStyle percentagePositive = _baseFont.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.success,
    height: 1.4,
  );

  static TextStyle percentageNegative = _baseFont.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.error,
    height: 1.4,
  );

  // Button text
  static TextStyle button = _baseFont.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.surface,
    height: 1.4,
  );

  // Tab text
  static TextStyle tabActive = _baseFont.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static TextStyle tabInactive = _baseFont.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.4,
  );
}

