import 'package:flutter/material.dart';
import 'package:flutter_demo/common_widget/app_text.dart';
import 'package:flutter_demo/utils/app_color.dart';
import 'package:flutter_demo/utils/app_font_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class AppButton extends StatelessWidget {
  final String text;
  final AppTextStyle? style;
  final double? paddingTop;
  final double? paddingBottom;
  final double? margin;
  final double? borderRadius;
  final double? borderWidth;
  final Color? shadowColor;
  final Color? buttonColor;
  final Color? borderColor;
  final double? blurRadius;
  final double? width;
  final double? height;
  final double? drawableMargin;
  final VoidCallback? onPressed;
  final Color? textColor;
  final dynamic drawableLeft;
  final dynamic drawableRight;
  final dynamic textSize;
  final EdgeInsetsGeometry? drawableRightPadding;

  const AppButton(
      {required this.text,
      this.style,
      this.paddingTop,
      this.paddingBottom,
      this.margin,
      this.width,
      this.height,
      this.drawableLeft,
      this.blurRadius,
        this.borderWidth,
      this.drawableMargin,
      this.shadowColor,
      this.textColor,
      this.buttonColor,
      this.borderColor,
      this.onPressed,
      this.borderRadius,
      this.textSize,
      this.drawableRight,
      this.drawableRightPadding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor ?? AppColor.blueTextColor,
              shape: BoxShape.rectangle,
              border: Border.all(
                  width: borderWidth??0.w,
                  color:
                      (borderColor ?? buttonColor ?? AppColor.blueTextColor)),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  borderRadius ?? 30,
                ),
              ),
            ),
            width: width ?? MediaQuery.of(context).size.width,
            height: height ?? 58.h,
            margin: EdgeInsets.symmetric(horizontal: margin ?? 20),
            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 0, right: 0),
            child: Center(
              child: drawableLeft != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        drawableLeft,
                        SizedBox(
                          width: drawableMargin ?? 0,
                        ),
                        getText()
                      ],
                    )
                  : drawableRight != null
                      ? Padding(
                        padding: drawableRightPadding??EdgeInsets.only(right: 25.w, left: 35.w),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getText(),
                              drawableRight,
                            ],
                          ),
                      )
                      : getText(),
            ),
          ),
        ],
      ),
    );
  }

  Widget getText() {
    return AppText(
      text: text,
      textAlign: TextAlign.center,
      textSize: textSize ?? 17.sp,
      style: style??AppTextStyle.medium,
      fontFamily: AppFontType.fontFamily,
      color: textColor ?? AppColor.white,
      lineHeight: 0,
    );
  }
}
