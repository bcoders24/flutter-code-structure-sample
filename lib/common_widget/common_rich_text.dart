import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/app_color.dart';
import 'package:flutter_demo/utils/app_font_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';


class CommonRichText extends StatelessWidget {
  final String?simpleText;
  final String?heightLightedText;
  final VoidCallback? onPressed;
  final Color? simpleTextColor;
  const CommonRichText({super.key,
    this.simpleText,
    this.heightLightedText,
    this.onPressed,
    this.simpleTextColor
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: <InlineSpan>[
      TextSpan(
        text: simpleText,
        style: TextStyle(
            fontSize: 13.sp,
            letterSpacing: -0.65,
           fontFamily:AppFontType.fontFamily,
            fontWeight: FontWeight.w600,
            color:simpleTextColor??AppColor.gray818181),
      ),
      TextSpan(
        recognizer: TapGestureRecognizer()
          ..onTap = onPressed,
        text: heightLightedText,
        style: TextStyle(
            fontSize: 13.sp,
            letterSpacing: -0.65,
            fontWeight: FontWeight.w600,
            fontFamily:AppFontType.fontFamily,
            color:AppColor.blueTextColor),
      ),
    ]));
  }
}
