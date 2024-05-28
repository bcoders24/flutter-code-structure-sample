import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';


class KeyboardOverlay {
  static OverlayEntry? _overlayEntry;

  static showOverlay(BuildContext context,{VoidCallback? onTapCancel,VoidCallback? onTapDone,bool show = false}) {
    if(_overlayEntry != null) {
      return;
    }
        OverlayState? overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      return show ? KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child:isKeyboardVisible ? Positioned(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                right: 0.0,
                left: 0.0,
                child: InputDoneView(
                  onTapCancel: onTapCancel,
                  onTapDone: onTapDone,
                )) : const SizedBox(),
          );
        },
      ) : const
      SizedBox();
    });

    overlayState.insert(_overlayEntry!);
  }

  static removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}

class InputDoneView extends StatelessWidget {
  const InputDoneView({Key? key, this.onTapDone,this.onTapCancel}) : super(key: key);
  final VoidCallback? onTapDone;
  final VoidCallback? onTapCancel;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 44,
        color: CupertinoColors.extraLightBackgroundGray,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            onTapCancel != null ?  Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
              child: CupertinoButton(
                padding: const EdgeInsets.only(
                    left: 24.0,),
                onPressed: onTapCancel ?? () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: const Text("Cancel", style: TextStyle(color: CupertinoColors.activeBlue)
                ),
              ),
            ): const SizedBox(),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
              child: CupertinoButton(
                padding: const EdgeInsets.only(right: 24.0,),
                onPressed: onTapDone ?? () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: const Text("Done",
                    style: TextStyle(color: CupertinoColors.activeBlue,)
                ),
              ),
            ),
          ],
        )
    );
  }
}