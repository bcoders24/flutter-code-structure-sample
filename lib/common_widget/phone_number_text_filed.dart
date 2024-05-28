
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/utils/app_color.dart';
import 'package:flutter_demo/utils/app_string.dart';
import 'package:flutter_demo/utils/keyboard_overlay.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PhoneNumberTextField extends StatelessWidget {
  final String? title;
  final String? hint;
  final String? initialValue;
  final String? label;
  final String? obscuringCharacter;
  final int? lines;
  final double? hintSize;
  final Widget? titleWidget;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? inputType;
  final TextInputAction? action;
  final Widget? suffix;
  final Widget? prefixIcon;
  final bool? password;
  final double? vPadding;
  final EdgeInsetsGeometry? hPadding;
  final bool isExpanded;
  final bool enabled;
  final Color? fillColor;
  final TextStyle? customText;
  final Color? borderSideColor;
  final double? sizedBoxWidth;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final double? borderRadius;
  final FontWeight? titleWeight;
  final VoidCallback? onClickSuffix;
  final bool obscureText;
  final globalkey;
  final VoidCallback? onTap;
  final EdgeInsets? scrollPadding;

  const PhoneNumberTextField(
      {this.title,
        this.hint,
        this.initialValue,
        this.label,
        this.hintSize,
        this.obscuringCharacter,
        this.vPadding,
        this.onChanged,
        this.lines,
        this.titleWidget,
        this.action,
        this.inputType,
        this.validator,
        this.password,
        this.focusNode,
        this.suffix,
        this.sizedBoxWidth,
        this.fillColor,
        this.isExpanded = true,
        this.customText,
        this.enabled = true,
        this.hPadding,
        this.borderSideColor,
        this.controller,
        this.textCapitalization = TextCapitalization.none,
        this.inputFormatters,
        this.borderRadius,
        this.titleWeight,
        this.prefixIcon,
        this.obscureText = false,
        this.globalkey,
        this.onClickSuffix, this.onTap, this.scrollPadding});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (inputType != null &&
        (inputType == TextInputType.number|| inputType == TextInputType.phone) &&
        focusNode != null) {
      focusNode!.addListener(() {
        bool hasFocus = focusNode!.hasFocus;
        if (hasFocus) {
          KeyboardOverlay.showOverlay(context, show: true);
        } else {
          KeyboardOverlay.removeOverlay();
        }
      });
    } else {
      KeyboardOverlay.removeOverlay();
    }
    return Container(
      height: 65.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width:1.w, color: borderSideColor??const Color(0xffE5B3B2)),
        borderRadius: BorderRadius.circular(20.r),
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColor.black.withOpacity(0.3),
        //     blurRadius: 10,
        //     offset: const Offset(3, 2),
        //   ),
        // ],
      ),
      child: Center(
        child: TextFormField(
          onTap: onTap,
          autofocus: false,
          obscuringCharacter: obscuringCharacter??"*",
          cursorHeight: 20.h,
          initialValue: initialValue,
          enabled: enabled,
          controller: controller,
          obscureText: password ?? false,
          validator: validator,
          focusNode: focusNode,
          maxLines: lines ?? 1,
          scrollPadding:scrollPadding??const EdgeInsets.all(20.0) ,
          cursorColor: AppColor.lightText.withOpacity(0.2),
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: hPadding ??
                (lines == null || lines == 1
                    ? EdgeInsets.symmetric(
                    horizontal: 20, vertical: vPadding ?? 20)
                    : const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
            hintText: hint,
            /*  labelText: label,*/
            // filled: true,
            //isCollapsed: true,
            // floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: const TextStyle(
                color: AppColor.themeColor,
                fontSize: 15,
                fontFamily: Strings.Font_Family_Compact,
                fontWeight: FontWeight.w400
            ),
            hintStyle:  TextStyle(
              color: Color(0xff000000),
              fontSize:hintSize??17,
              fontWeight: FontWeight.w400,
              fontFamily: Strings.Font_Family_Compact,
            ),
            fillColor: fillColor ?? Colors.white,
            /*   filled: true,
            isDense: true,*/
            prefixIcon: prefixIcon,
            prefixIconColor: AppColor.black,
            prefixIconConstraints: BoxConstraints(maxWidth: 90.w,minWidth: 90.w),
            suffixIcon: suffix == null
                ? null
                : GestureDetector(
              onTap: onClickSuffix,
              child: Center(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: ConstrainedBox(
                  constraints:
                  const BoxConstraints(minWidth: 28, minHeight: 28),
                  child: IconTheme.merge(
                    data: const IconThemeData(
                      color: Color(0xff334A8C),
                      size: 28,
                    ),
                    child: Container(
                        margin: const EdgeInsets.only(right: 0), child: suffix!),
                  ),
                ),
              ),
            ),
            border: InputBorder.none,
            // border: UnderlineInputBorder(
            //   borderRadius: BorderRadius.all(
            //     Radius.circular(borderRadius ?? 0),
            //   ),
            //   borderSide: const BorderSide(
            //       style: BorderStyle.solid, color: Colors.white, width: 0),
            // ),
            // errorBorder: UnderlineInputBorder(
            //   borderRadius: BorderRadius.all(
            //     Radius.circular(borderRadius ?? 0),
            //   ),
            //   borderSide: BorderSide(
            //       style: BorderStyle.solid, color: AppColor.white, width: 0),
            // ),
            focusedBorder: InputBorder.none,
            errorMaxLines: 2,
            errorStyle: const TextStyle(
                color: Colors.red, fontSize: 14,fontWeight: FontWeight.w400),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? 0),
              ),
              borderSide: const BorderSide(
                  style: BorderStyle.solid, color: Colors.transparent, width: 0),
            ),
          ),
          style:customText?? const TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500),
          keyboardType: inputType ??
              (lines != null ? TextInputType.multiline : TextInputType.name),
          textInputAction:
          action ?? (lines != null ? null : TextInputAction.done),
        ),
      ),
    );
  }
}

