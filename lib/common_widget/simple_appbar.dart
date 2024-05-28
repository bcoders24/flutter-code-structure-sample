import 'package:flutter/material.dart';
import 'package:flutter_demo/common_widget/app_text.dart';
import 'package:flutter_demo/common_widget/back_button.dart';
import 'package:flutter_demo/utils/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget{

  String? title;
  Widget?leading;
  Widget?rightButton;
  Color? backgroundColor;
  final VoidCallback? onPressed;
  bool? centerTitle;

  SimpleAppBar(
      {super.key, this.onPressed, this.title,this.leading,this.rightButton, this.backgroundColor,
      this.centerTitle});

  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: backgroundColor,
      scrolledUnderElevation: 0,
      centerTitle: centerTitle,
      leading: leading??Padding(
        padding: const EdgeInsets.only(left: 15),
        child: BackButtonWidget(
          onPressed: (){
            onPressed!=null?onPressed!():Get.back();
          },
        ),
      ),
      title: AppText(
        text: title ?? " ",
        color: AppColor.black,textSize: 20.sp,style: AppTextStyle.bold,
      ),
      actions: [
        rightButton??const SizedBox()
      ],
    );
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 15.h,bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: const Color(0xffF1F1F1),
              ),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 15.sp,
                color: Colors.black,
              ),
            ),
          ),

          AppText(
            text: title ?? " ",
            color: AppColor.white,textSize: 20.sp,style: AppTextStyle.semibold,
          ),

          rightButton??SizedBox(
            width: 30.w,
          ),


        ],
      ),
    );





  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


}
