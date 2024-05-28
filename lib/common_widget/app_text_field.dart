import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/common_widget/app_text.dart';
import 'package:flutter_demo/utils/app_color.dart';
import 'package:flutter_demo/utils/app_font_type.dart';
import 'package:flutter_demo/utils/keyboard_overlay.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';



class AppTextField extends StatefulWidget {
  final String? title;
  final String? hint;
  final String? label;
  final int? maxLength;
  final String? obscuringCharacter;
  final String? errorText;
  final int? lines;
  final Widget? titleWidget;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
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
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final double? borderRadius;
  final FontWeight? titleWeight;
  final VoidCallback? onClickSuffix;
  final bool obscureText;
  final globalkey;
  final String? initialText;
  final Color? labelColor;
  final Color? hintColor;
  final FocusNode? focusNode;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? dontShowDoneButtonForIos;

  const AppTextField({
    super.key,
    this.title,
    this.hint,
    this.label,
    this.maxLength,
    this.obscuringCharacter,
    this.vPadding,
    this.onChanged,
    this.lines,
    this.errorText,
    this.titleWidget,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    this.password,
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
    this.onClickSuffix,
    this.initialText, this.labelColor, this.hintColor,
    this.focusNode,
    this.floatingLabelBehavior,
    this.dontShowDoneButtonForIos
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode focusNode;
  late TextEditingController controller;

  Color borderColor = AppColor.borderColor;
  bool _obscureText = false;
  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode??FocusNode();
    _obscureText = widget.obscureText;

    focusNode.addListener(() {
      borderColor = focusNode.hasFocus ? AppColor.primary : AppColor.borderColor;
      setState(() {});
    });
    super.initState();
  }



  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) {
      addCloseKeyboardOverlayForIOSNumberInput(context);
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.zero,
      child: Stack(
        children: [

          if(widget.label!=null && controller.text.isNotEmpty)AppText(text: widget.label!,
          color: AppColor.blueTextColor,style: AppTextStyle.regular,textSize: 12.sp,fontFamily: AppFontType.fontFamily,)
          .paddingOnly(left: 20,right: 18,top: 14.h),
          TextFormField(
            initialValue: widget.initialText,
            autofocus: false,
            maxLength: widget.maxLength,
            //obscuringCharacter: obscuringCharacter ?? "*",
            cursorHeight: 20.0,
            enabled: widget.enabled,
            controller: controller,
            obscureText: _obscureText,
            validator: widget.validator,
            focusNode: focusNode,
            maxLines: widget.lines ?? 1,
            cursorColor: Colors.black.withOpacity(0.5),
            inputFormatters: widget.inputFormatters,
            textCapitalization: widget.textCapitalization,
            onChanged: (text){
              setState(() {});
              if(widget.onChanged!=null) {
                widget.onChanged!(text);
              }
            },
            decoration: InputDecoration(
              counterText: '',
              contentPadding: widget.hPadding ??
                  (widget.lines == null || widget.lines == 1
                      ? EdgeInsets.symmetric(horizontal: 20, vertical: widget.vPadding ?? 14.h)
                      : const EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
              hintText: widget.hint,
              errorMaxLines: 4,
              // labelText: widget.label,
              // alignLabelWithHint: true,
              // filled: true,
                isCollapsed:true,
              // isCollapsed: focusNode.hasFocus? false:true,
              // floatingLabelAlignment: FloatingLabelAlignment.center,
              // floatingLabelBehavior: widget.floatingLabelBehavior??FloatingLabelBehavior.auto,
              // floatingLabelStyle: const TextStyle(
              //     color: AppColor.blueTextColor,
              //     fontSize: 15,
              //     fontWeight: FontWeight.w400),
              // labelStyle: const TextStyle(
              //     color: AppColor.blueTextColor,
              //     fontSize: 12,
              //     fontWeight: FontWeight.w400),
              hintStyle: TextStyle(
                color: widget.hintColor??AppColor.hintTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: AppFontType.fontFamily,
              ),
              fillColor: widget.fillColor ?? Colors.transparent,
              focusColor: AppColor.primary,
              /*   filled: true,
              isDense: true,*/
              errorText: widget.errorText,
              errorStyle: const TextStyle(
                color: Color(0xffCE0909), // Error text color
              ),
              prefixIcon: widget.prefixIcon,
              prefixIconColor: Colors.black54,
              // prefixIconConstraints: BoxConstraints(maxWidth: 50.0, minWidth: 50.w),
              suffixIcon:widget.password==true? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText ; // Toggle visibility
                  });
                },
              ):widget.suffix == null
                  ? null
                  : GestureDetector(
                onTap: widget.onClickSuffix,
                child: Center(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: ConstrainedBox(
                    constraints:
                    const BoxConstraints(minWidth: 28, minHeight: 28),
                    child: IconTheme.merge(
                      data: const IconThemeData(
                        color: Color(0xff494964),
                        size: 28,
                      ),
                      child: Container(
                          margin: const EdgeInsets.only(right: 0),
                          child: widget.suffix!),
                    ),
                  ),
                ),
              ),
              // border: InputBorder.none,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
            style: widget.customText ??
                const TextStyle(
                    color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400,
                    fontFamily: AppFontType.fontFamily),
            keyboardType: widget.keyboardType ??
                (widget.lines != null ? TextInputType.multiline : TextInputType.name),
            textInputAction:
            widget.textInputAction ?? (widget.lines != null ? null : TextInputAction.done),
          ).marginOnly(top: widget.label!=null&& controller.text.isNotEmpty?16:7,
          bottom: widget.label!=null && controller.text.isEmpty?9:widget.label==null?8:0),
        ],
      ),
    );
  }

  addCloseKeyboardOverlayForIOSNumberInput(BuildContext context){
    if (widget.keyboardType != null && (widget.keyboardType == TextInputType.number ||
        widget.keyboardType == TextInputType.phone)) {
      focusNode.addListener(() {
        bool hasFocus = focusNode.hasFocus;
        if (hasFocus) {
          KeyboardOverlay.showOverlay(context,);
        } else {
          KeyboardOverlay.removeOverlay();
        }
      });
    } else {
      KeyboardOverlay.removeOverlay();
    }
  }
}

class AppTextFieldMultiline extends StatefulWidget {
  final String? title;
  final String? hint;
  final String? label;
  final int? maxLength;
  final String? obscuringCharacter;
  final String? errorText;
  final int? lines;
  final Widget? titleWidget;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
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
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final double? borderRadius;
  final FontWeight? titleWeight;
  final VoidCallback? onClickSuffix;
  final bool obscureText;
  final globalkey;
  final String? initialText;
  final Color? labelColor;
  final Color? hintColor;
  final FocusNode? focusNode;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? dontShowDoneButtonForIos;

  const AppTextFieldMultiline({
    super.key,
    this.title,
    this.hint,
    this.label,
    this.maxLength,
    this.obscuringCharacter,
    this.vPadding,
    this.onChanged,
    this.lines,
    this.errorText,
    this.titleWidget,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    this.password,
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
    this.onClickSuffix,
    this.initialText, this.labelColor, this.hintColor,
    this.focusNode,
    this.floatingLabelBehavior,
    this.dontShowDoneButtonForIos
  });

  @override
  State<AppTextFieldMultiline> createState() => _AppTextFieldStateMultiline();
}

class _AppTextFieldStateMultiline extends State<AppTextFieldMultiline> {
  late FocusNode focusNode;
  late TextEditingController controller;

  Color borderColor = AppColor.borderColor;
  bool _obscureText = false;
  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode??FocusNode();
    _obscureText = widget.obscureText;

    focusNode.addListener(() {
      borderColor = focusNode.hasFocus ? AppColor.primary : AppColor.borderColor;
      setState(() {});
    });
    super.initState();
  }



  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) {
      addCloseKeyboardOverlayForIOSNumberInput(context);
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.zero,
      child: Stack(
        children: [

          if(widget.label!=null && controller.text.isNotEmpty)AppText(text: widget.label!,
            color: AppColor.blueTextColor,style: AppTextStyle.regular,textSize: 12.sp,fontFamily: AppFontType.fontFamily,)
              .paddingOnly(left: 20,right: 18,top: 14.h),
          TextFormField(
            initialValue: widget.initialText,
            autofocus: false,
            maxLength: widget.maxLength,
            //obscuringCharacter: obscuringCharacter ?? "*",
            cursorHeight: 20.0,
            enabled: widget.enabled,
            controller: controller,
            obscureText: _obscureText,
            validator: widget.validator,
            focusNode: focusNode,
            maxLines: widget.lines,
            cursorColor: Colors.black.withOpacity(0.5),
            inputFormatters: widget.inputFormatters,
            textCapitalization: widget.textCapitalization,
            onChanged: (text){
              setState(() {});
              if(widget.onChanged!=null) {
                widget.onChanged!(text);
              }
            },
            decoration: InputDecoration(
              counterText: '',
              contentPadding: widget.hPadding ??
                  (widget.lines == null || widget.lines == 1
                      ? EdgeInsets.symmetric(horizontal: 20, vertical: widget.vPadding ?? 14.h)
                      : const EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
              hintText: widget.hint,
              errorMaxLines: 4,
              // labelText: widget.label,
              // alignLabelWithHint: true,
              // filled: true,
              isCollapsed:true,
              // isCollapsed: focusNode.hasFocus? false:true,
              // floatingLabelAlignment: FloatingLabelAlignment.center,
              // floatingLabelBehavior: widget.floatingLabelBehavior??FloatingLabelBehavior.auto,
              // floatingLabelStyle: const TextStyle(
              //     color: AppColor.blueTextColor,
              //     fontSize: 15,
              //     fontWeight: FontWeight.w400),
              // labelStyle: const TextStyle(
              //     color: AppColor.blueTextColor,
              //     fontSize: 12,
              //     fontWeight: FontWeight.w400),
              hintStyle: TextStyle(
                color: widget.hintColor??AppColor.hintTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: AppFontType.fontFamily,
              ),
              fillColor: widget.fillColor ?? Colors.transparent,
              focusColor: AppColor.primary,
              /*   filled: true,
              isDense: true,*/
              errorText: widget.errorText,
              errorStyle: const TextStyle(
                color: Color(0xffCE0909), // Error text color
              ),
              prefixIcon: widget.prefixIcon,
              prefixIconColor: Colors.black54,
              // prefixIconConstraints: BoxConstraints(maxWidth: 50.0, minWidth: 50.w),
              suffixIcon:widget.password==true? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText ; // Toggle visibility
                  });
                },
              ):widget.suffix == null
                  ? null
                  : GestureDetector(
                onTap: widget.onClickSuffix,
                child: Center(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: ConstrainedBox(
                    constraints:
                    const BoxConstraints(minWidth: 28, minHeight: 28),
                    child: IconTheme.merge(
                      data: const IconThemeData(
                        color: Color(0xff494964),
                        size: 28,
                      ),
                      child: Container(
                          margin: const EdgeInsets.only(right: 0),
                          child: widget.suffix!),
                    ),
                  ),
                ),
              ),
              // border: InputBorder.none,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
            style: widget.customText ??
                const TextStyle(
                    color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400,
                    fontFamily: AppFontType.fontFamily),
            keyboardType: widget.keyboardType ??
                (widget.lines != null ? TextInputType.multiline : TextInputType.name),
            textInputAction:
            widget.textInputAction ?? (widget.lines != null ? null : TextInputAction.done),
          ).marginOnly(top: widget.label!=null&& controller.text.isNotEmpty?16:7,
              bottom: widget.label!=null && controller.text.isEmpty?9:widget.label==null?8:0),
        ],
      ),
    );
  }

  addCloseKeyboardOverlayForIOSNumberInput(BuildContext context){
    if (widget.keyboardType != null && (widget.keyboardType == TextInputType.number ||
        widget.keyboardType == TextInputType.phone)) {
      focusNode.addListener(() {
        bool hasFocus = focusNode.hasFocus;
        if (hasFocus) {
          KeyboardOverlay.showOverlay(context,);
        } else {
          KeyboardOverlay.removeOverlay();
        }
      });
    } else {
      KeyboardOverlay.removeOverlay();
    }
  }
}

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Define the allowed characters regex pattern.
    final RegExp allowedChars = RegExp(r"[a-zA-Z0-9'-]");

    // Check if the new value contains only allowed characters.
    if (allowedChars.hasMatch(newValue.text)) {
      // If not, return the old value to prevent the input.
      return newValue;
    }

    // If the new value contains only allowed characters, allow the input.
    return oldValue;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class NoSpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Disallow spaces in the input
    if (newValue.text.contains(' ')) {
      // If space is found, return the old value
      return oldValue;
    }
    // Otherwise, return the new value
    return newValue;
  }
}


class CurrencyInputFormatter extends TextInputFormatter {
  final bool allowDecimal; // Optional flag to allow decimal input

  CurrencyInputFormatter({this.allowDecimal = true});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // If the new value is empty, just show "$"
    if (newValue.text.isEmpty) {
      return TextEditingValue(text: '\$');
    }

    // If the new value does not start with "$", pre-append "$"
    if (!newValue.text.startsWith('\$')) {
      return TextEditingValue(text: '\$${newValue.text}');
    }

    // Otherwise, just return the new value as is
    return newValue;
  }
}

