import 'package:flutter/material.dart';

class TextIconModul extends StatelessWidget {
  final String label;
  const TextIconModul({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(label,
        style: const TextStyle(
          fontSize: 12,
          fontFamily: "Poppins",
          color: Colors.black,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}