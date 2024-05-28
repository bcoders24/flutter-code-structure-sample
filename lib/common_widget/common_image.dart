import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/app_color.dart';
import 'package:flutter_demo/utils/app_string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';




enum AppImageType {networkImage, fileImage}

class CommonImageView extends StatelessWidget {
  final dynamic height;
  final dynamic width;
  final String imagePath;
  final AppImageType imageType;
  final BoxShape shape;
  final dynamic borderRadius;
  final dynamic topLeft;
  final dynamic topRight;
  final dynamic bottomLeft;
  final dynamic bottomRight;
  final Color? borderColor;
  final dynamic borderWidth;
  final ColorFilter? colorFilter;
  final BoxFit? boxFit;
  final Color? bgColor;
  final dynamic loaderSize;

  const CommonImageView({Key? key,
    required this.height,
    required this.width,
    required this.imagePath,
    required this.imageType,
    required this.shape,
    this.borderRadius,
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.borderColor,
    this.borderWidth,
    this.colorFilter,
    this.boxFit,
    this.bgColor,
    this.loaderSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(imageType == AppImageType.networkImage) {
      return GetPlatform.isWeb?_cachedNetworkImage():_cachedNetworkImage();
    } else {
      return _fileImage();
    }
  }

  Widget _fileImage(){
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: shape,
        color: Colors.transparent,
        border: shape == BoxShape.rectangle?Border.all(width: 1, color: borderColor??Colors.transparent):null,
        borderRadius:shape == BoxShape.rectangle?topLeft==null?BorderRadius.all(Radius.circular(borderRadius??0)):
        BorderRadius.only(topLeft: Radius.circular(topLeft??0), topRight: Radius.circular(topRight??0),
            bottomLeft: Radius.circular(bottomLeft??0), bottomRight: Radius.circular(bottomRight??0)):null,
        image: DecorationImage(
          image: FileImage(File(imagePath)),
          fit: BoxFit.cover,),
      ),
    );
  }

  Widget _cachedNetworkImage(){
    return shape == BoxShape.rectangle?CachedNetworkImage(
      imageUrl: imagePath.contains("png") || imagePath.contains("jpg") || imagePath.contains("jpeg")?imagePath
          : Strings.defaultImageLink,
        // errorWidget: (context,imagePath,error)=>SizedBox(
        //     width: width,
        //     height: height,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Icon(Icons.error,color: Colors.red,size: 30.sp,),
        //         SizedBox(height: 10.h,),
        //         AppText(
        //           text: "Invalid Image",
        //           textSize: 12.sp,
        //           lineHeight: 1.5.h,
        //           fontFamily: Strings.Font_Family_Compact,
        //           color: const Color(0x80000004),
        //           style: AppTextStyle.compactRoundedRegular,
        //         ),
        //       ],
        //     )),


      imageBuilder: (context, imageProvider) =>
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape: shape,
              color: Colors.transparent,
              borderRadius: topLeft==null?BorderRadius.all(Radius.circular(borderRadius??0.r)):
              BorderRadius.only(topLeft: Radius.circular(topLeft??0.r), topRight: Radius.circular(topRight??0.r),
                  bottomLeft: Radius.circular(bottomLeft??0.r), bottomRight: Radius.circular(bottomRight??0.r)),
              // border: Border.all(
              //     width: borderWidth??0,
              //     color: borderColor ?? Theme.of(context)
              //         .scaffoldBackgroundColor),
              image: DecorationImage(
                image: imageProvider,
                fit: boxFit??BoxFit.cover,
                colorFilter: colorFilter,
              ),
            ),
          ),
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: topLeft==null?BorderRadius.all(Radius.circular(borderRadius??0.r)):
            BorderRadius.only(topLeft: Radius.circular(topLeft??0.r), topRight: Radius.circular(topRight??0.r),
                bottomLeft: Radius.circular(bottomLeft??0.r), bottomRight: Radius.circular(bottomRight??0.r)),
            color: Colors.transparent
        ),
        child:  Center(
            child: SizedBox(
              width: loaderSize??25,
              height: loaderSize??25,
              child: const CircularProgressIndicator(
                  valueColor:
                  AlwaysStoppedAnimation<
                      Color>(AppColor.themeColor)),
            )),
      ),
      errorWidget: (_,__,___){
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: shape,
            color: Colors.transparent,
            borderRadius: topLeft==null?BorderRadius.all(Radius.circular(borderRadius??0.r)):
            BorderRadius.only(topLeft: Radius.circular(topLeft??0.r), topRight: Radius.circular(topRight??0.r),
                bottomLeft: Radius.circular(bottomLeft??0.r), bottomRight: Radius.circular(bottomRight??0.r)),
            // image: DecorationImage(
            //   image: const AssetImage(Assets.imagesDefaultUserSquare),
            //   fit: boxFit??BoxFit.cover,
            //   colorFilter: colorFilter,
            //
            // ),
          ),
        );
      },
    ):
    CachedNetworkImage(
      imageUrl: imagePath,
      fit: BoxFit.fill,
      imageBuilder: (context, imageProvider) =>
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: borderWidth??2,
                  color: borderColor??AppColor.themeColor),
              image: DecorationImage(
                image: imageProvider,
                fit: boxFit??BoxFit.cover,
              ),
            ),
          ),
      placeholder: (context, url) => Container(
        width: width??60.w,
        height: height??60.h,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent
        ),
        child:  Center(
            child: SizedBox(
              width: loaderSize??25,
              height: loaderSize??25,
              child: const CircularProgressIndicator(
                  valueColor:
                  AlwaysStoppedAnimation<
                      Color>(AppColor.themeColor)),
            )),
      ),
      errorWidget: (_,__,___){
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            // image: DecorationImage(
            //   image: const AssetImage(Assets.imagesDefaultUser),
            //   fit: boxFit??BoxFit.cover,
            //   colorFilter: colorFilter,
            //
            // ),
          ),
        );
      },
    );
  }

  Widget _webNetworkImage(){
    return Container(
      decoration: BoxDecoration(
        shape: shape,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      width: width,height: height,
      child: Image.network(
          imagePath,
          width: width,height: height,
          loadingBuilder: (_, __, progress){
            return const Center(
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: CircularProgressIndicator(
                      valueColor:
                      AlwaysStoppedAnimation<
                          Color>(AppColor.themeColor)),
                ));
          }

      ),
    );
  }
}

const defaultImage = Strings.defaultImageLink;
