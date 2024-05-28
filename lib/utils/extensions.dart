import 'package:flutter/material.dart';






extension ExtendedString on String{
  // (<member definition>)*
  bool get isValidName {
    return !contains(RegExp(r'[0–9]'));
  }

  String get prefixWith {
    return '${this} $this';
  }
  bool get isValidEmail {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(this);
  }

  String get capsFirst{
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  int get toInt {
    return int.tryParse(this) ?? 0;
  }


}

extension ExtendedInt on int{

}


extension PaddingExtension on Widget {
  Widget withPadding({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }
}


// how to use
// Text('I am aligned at the start').alignAtStart(),
extension ExtendedAlign on Widget{

  alignAtTopRight() {
    return Align(
      alignment: Alignment.topRight,
      child: this,
    );
  }

  alignAtStart() {
    return Align(
      alignment: Alignment.centerLeft,
      child: this,
    );
  }

  alignAtCenter() {
    return Align(
      alignment: Alignment.center,
      child: this,
    );
  }

  alignAtEnd() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: this,
    );
  }
}

extension GestureDetectorExtension on Widget {
  GestureDetector onTap(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: this,
    );
  }
}

extension EmptyPadding on num{
  SizedBox get pixelH=>SizedBox(
    height: toDouble(),
  );

  SizedBox get pixelW=>SizedBox(
    width: toDouble(),
  );
}

extension SizeExtension on BuildContext{
  double get screenWidth=>MediaQuery.of(this).size.width;
  double get screenHeight=>MediaQuery.of(this).size.height;
}

extension DoubleExtension on double{
  String formatDoubleValue({int? value}) {
    String result = toStringAsFixed(value??2);
    if (result.endsWith('.00')) {
      // Remove the .00 if the value is a whole number
      result = result.substring(0, result.length - 3);
    }
    return result;
  }
}