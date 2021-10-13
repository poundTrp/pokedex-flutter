import 'package:flutter/material.dart';

enum ModalSize {
  fullSize,
  halfSize,
}

class CustomModal extends StatelessWidget {
  final Widget widget;
  final ModalSize? modalSize;

  CustomModal({required this.widget, this.modalSize});

  double handleModalSize(BuildContext context) {
    if (modalSize != null || modalSize == ModalSize.halfSize) {
      return MediaQuery.of(context).size.height / 4;
    }
    return MediaQuery.of(context).size.height / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: handleModalSize(context),
      color: Colors.transparent,
      child: Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: new Radius.circular(20.0),
            topRight: new Radius.circular(20.0),
          ),
        ),
        child: widget,
      ),
    );
  }
}
