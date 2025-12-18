import 'package:flutter/material.dart';
import '../constants/constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign align;
  final int? maxLines;
  final TextOverflow overflow;
  final Color? color;

  const CustomText(
    this.text, {
    Key? key,
    this.style = AppTextStyles.bodyMedium,
    this.align = TextAlign.left,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.color,
  }) : super(key: key);

  // ================= HEADINGS =================

  factory CustomText.heading1(
    String text, {
    Key? key,
    TextAlign align = TextAlign.left,
    int? maxLines,
    TextOverflow overflow = TextOverflow.ellipsis,
    Color? color,
  }) {
    return CustomText(
      text,
      key: key,
      style: AppTextStyles.heading1.copyWith(color: color),
      align: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory CustomText.heading2(
    String text, {
    Key? key,
    TextAlign align = TextAlign.left,
    int? maxLines,
    TextOverflow overflow = TextOverflow.ellipsis,
    Color? color,
  }) {
    return CustomText(
      text,
      key: key,
      style: AppTextStyles.heading2.copyWith(color: color),
      align: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory CustomText.heading3(
    String text, {
    Key? key,
    TextAlign align = TextAlign.left,
    int? maxLines,
    TextOverflow overflow = TextOverflow.ellipsis,
    Color? color,
  }) {
    return CustomText(
      text,
      key: key,
      style: AppTextStyles.heading3.copyWith(color: color),
      align: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  // ================= BODY =================

  factory CustomText.bodyLarge(
    String text, {
    Key? key,
    TextAlign align = TextAlign.left,
    int? maxLines,
    TextOverflow overflow = TextOverflow.ellipsis,
    Color? color,
  }) {
    return CustomText(
      text,
      key: key,
      style: AppTextStyles.bodyLarge.copyWith(color: color),
      align: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory CustomText.bodyMedium(
    String text, {
    Key? key,
    TextAlign align = TextAlign.left,
    int? maxLines,
    TextOverflow overflow = TextOverflow.ellipsis,
    Color? color,
  }) {
    return CustomText(
      text,
      key: key,
      style: AppTextStyles.bodyMedium.copyWith(color: color),
      align: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory CustomText.bodySmall(
    String text, {
    Key? key,
    TextAlign align = TextAlign.left,
    int? maxLines,
    TextOverflow overflow = TextOverflow.ellipsis,
    Color? color,
  }) {
    return CustomText(
      text,
      key: key,
      style: AppTextStyles.bodySmall.copyWith(color: color),
      align: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  // ================= PRICE =================

  factory CustomText.price(
    String text, {
    Key? key,
    TextAlign align = TextAlign.left,
    TextOverflow overflow = TextOverflow.ellipsis,
    Color? color,
  }) {
    return CustomText(
      text,
      key: key,
      style: AppTextStyles.price.copyWith(color: color),
      align: align,
      overflow: overflow,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
