import 'package:flutter/material.dart';

class CustomToast extends StatelessWidget {
  final String text;
  final Color textColor;

  const CustomToast({super.key, required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }

  static void showToast(BuildContext context, String text, Color textColor) {
    final overlay = Overlay.of(context);
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 16.0, // Adjust the distance from the bottom as needed
        width: MediaQuery.of(context).size.width - 40,
        child: Material(
          color: Colors.transparent,
          child: CustomToast(text: text, textColor: textColor),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}

// Example of using the custom toast
// CustomToast.showToast(context, "Hello, this is a custom toast!", Colors.white);
