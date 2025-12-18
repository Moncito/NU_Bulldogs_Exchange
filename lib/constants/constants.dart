// NU Bulldogs Color Palette
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF002855); // NU Navy Blue
  static const Color secondary = Color(0xFFFFD700); // NU Gold/Yellow
  static const Color accent = Color(0xFFC8102E); // Red accent
  static const Color background = Color(0xFFF5F5F5);
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF666666);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Color(0xFFE0E0E0);
}

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  
  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  
  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );
  
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  
  static const TextStyle price = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.accent,
  );
}

class AppConstants {
  static const String appName = "NU Bulldogs Exchange";
  static const String appDescription = "Official National University Merchandise Store";
  static const String yourName = "Moncito Glenn Hernandez"; // ENHANCEMENT 1: Change to your name
  
  // Sample data
  static const List<String> categories = [
    "All",
    "Jerseys",
    "Hoodies",
    "Caps",
    "Accessories",
    "School Supplies"
  ];
}