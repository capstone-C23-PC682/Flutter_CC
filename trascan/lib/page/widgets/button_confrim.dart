import 'package:flutter/material.dart';

class ButtonConfrim extends StatelessWidget {
  const ButtonConfrim({Key? key, required this.label, required this.colorisi, required this.onClicked,}) : super(key: key);
  final String label;
  final Color colorisi;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: colorisi,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
        ),
        onPressed: onClicked,
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}