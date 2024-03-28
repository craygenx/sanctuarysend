import 'dart:async';
import 'package:flutter/material.dart';

enum ToastType { success, error }

class CustomToast {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final ToastType type;

  CustomToast({
    required this.message,
    required this.backgroundColor,
    required this.textColor,
    this.type = ToastType.success,
  });

  static show(BuildContext context, String message,
      {ToastType type = ToastType.success}) {
    Color backgroundColor =
        type == ToastType.success ? Colors.green : Colors.red;
    Color textColor = type == ToastType.success ? Colors.white : Colors.black;

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height > 600 ? 50.0 : 0.0,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Material(
            color: Colors.transparent,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    // Remove toast after 2 seconds
    Timer(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}
