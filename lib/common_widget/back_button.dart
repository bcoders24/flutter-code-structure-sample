import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0xffAEB3C0),
              offset: Offset(0, 1),
              blurRadius: 5,
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_back_ios_sharp,
            color: AppColor.black202226,
            size: 15,
          ),
        ),
      ),
    );
  }
}
