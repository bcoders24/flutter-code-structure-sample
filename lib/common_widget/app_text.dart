
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/app_color.dart';
import 'package:flutter_demo/utils/app_font_type.dart';

enum AppTextStyle {
  bold,
  medium,
  regular,
  semibold,
  light,
}

class AppText extends StatelessWidget {
  final String text;
  final dynamic color;
  final dynamic underlineColor;
  final AppTextStyle? style;
  final bool? underline;
  final bool? strikeThrough;
  final dynamic textSize;
  final bool? capitalise;
  final int? maxlines;
  final TextAlign? textAlign;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? lineHeight;
  final FontStyle? fontStyle;

  const AppText(
      {Key? key,
      required this.text,
      this.color,
      this.style,
      this.maxlines,
      this.textAlign,
      this.underline,
      this.textSize,
      this.fontFamily,
      this.fontWeight,
      this.lineHeight,
      this.fontStyle,
      this.underlineColor,
      this.strikeThrough,
      this.capitalise,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Text(
      capitalise != null && capitalise! ? text.toUpperCase() : text,
      maxLines: maxlines,
      overflow: maxlines != null ? TextOverflow.clip : null,
      textAlign: textAlign,
      style:
          getStyle(color ?? AppColor.black, textSize ?? getTextSize(width)),
    );
  }

  getTextSize(double width) {
    switch (style) {
      case AppTextStyle.bold:
        return width * 0.08;
      case AppTextStyle.medium:
        return width * 0.06;
      case AppTextStyle.semibold:
        return width * 0.02;
      default:
        return width * 0.04;
    }
  }

  TextStyle getStyle(
    Color color,
    double textSize,
  ) {
    return TextStyle(
        color: color,
        fontWeight: fontWeight ?? getWeight(),
        fontSize: textSize,
        fontStyle: fontStyle ?? FontStyle.normal,
        height: lineHeight ?? 1.0,
        fontFamily: fontFamily ?? AppFontType.fontFamily,
        decorationColor: underlineColor,
        decorationThickness: 4,
        decoration: strikeThrough != null && strikeThrough!
            ? TextDecoration.lineThrough
            : underline != null
                ? TextDecoration.underline
                : null);
  }

  FontWeight getWeight() {
    switch (style) {
      case AppTextStyle.bold:
        return FontWeight.w700;
      case AppTextStyle.medium:
        return FontWeight.w500;
      case AppTextStyle.regular:
        return FontWeight.w400;
      case AppTextStyle.light:
        return FontWeight.w300;
      case AppTextStyle.semibold:
        return FontWeight.w600;
      default:
        return FontWeight.w400;
    }
  }
}
