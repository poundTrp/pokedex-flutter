import 'package:flutter/material.dart';

class CustomModal extends StatelessWidget {
  final Widget widget;

  CustomModal({required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
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
