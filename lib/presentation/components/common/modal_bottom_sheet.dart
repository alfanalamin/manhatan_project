import 'package:flutter/material.dart';

class ModalBottomSheet {
  bool isShown = false;

  void showModal({
    required BuildContext context,
    required Widget content,
    required ShapeBorder? shapeBorder,
    required bool isScrollControlled,
    Function? onClose,
  }) {
    if (!isShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showModalBottomSheet(
            context: context,
            shape: shapeBorder,
            isScrollControlled: isScrollControlled,
            builder: (context) {
              return content;
            }).then((value) {
          if (onClose != null) {
            onClose.call();
          }
        });
      });
      isShown = true;
    }
  }
}
