

import 'package:flutter/material.dart';


class CustomRadioButton<T> extends StatelessWidget{
  final T value; // Unique value for the radio button
  final bool isSelected; // Indicates if the radio button is selected
  final Function(T) onChanged; // Callback for value change
  final Widget child;
  final double? gap;

  const CustomRadioButton({super.key,
    required this.value,
    required this.isSelected,
    required this.onChanged,
    required this.child,
    this.gap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //   isSelected?Image.asset(Assets.imagesIcRadioSel,height: 14,width: 14,):
          //   Image.asset(Assets.imagesIcRadioUnsel,height: 14,width: 14,),
          // gap?.pixelW??15.pixelW,
          // Expanded(child: child)
        ],
      ),
    );
  }
}

class CustomRadioButtonWithoutInkWell<T> extends StatelessWidget{
  final T value; // Unique value for the radio button
  final bool isSelected; // Indicates if the radio button is selected
  final Widget child;
  final double? gap;

  const CustomRadioButtonWithoutInkWell({super.key,
    required this.value,
    required this.isSelected,
    required this.child,
    this.gap
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // isSelected?Image.asset(Assets.imagesIcRadioSel,height: 14,width: 14,):
        // Image.asset(Assets.imagesIcRadioUnsel,height: 14,width: 14,),
        // gap?.pixelW??15.pixelW,
        // Expanded(child: child)
      ],
    );
  }
}