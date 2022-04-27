import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:prepare/data/constants.dart';

import 'home/home.dart';

class MyToast {
  static pushToast({required BuildContext context, required String text}) {
    showToastWidget(
      ToastBody(
        text: text,
      ),
      context: scaffoldKey.currentContext,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.slideToTop,
      position: StyledToastPosition.top,
      animDuration: Duration(milliseconds: 300),
      duration: Duration(seconds: 4),
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
      isIgnoring: true,
    );
  }
}

class ToastBody extends StatelessWidget {
  final String text;
  const ToastBody({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}
