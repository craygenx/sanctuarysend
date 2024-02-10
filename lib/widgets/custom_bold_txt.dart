import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  const BoldText({super.key, required this.text, this.fontSize = 12.0,
    this.color = Colors.black, this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyle(color: color, fontSize: fontSize,
          overflow: TextOverflow.ellipsis,fontWeight: fontWeight,
        ),
      ),
    );
  }
}