import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardFieldItemText extends StatelessWidget {
  final String label;
  final String? contentData;
  final int flexLeftRow;
  final int flexRightRow;
  const CardFieldItemText({
    Key? key,
    required this.label,
    required this.contentData,
    required this.flexLeftRow, 
    required this.flexRightRow
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: flexLeftRow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(label,
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),
                  textAlign: TextAlign.left,
                )
              ),
            ],
          ),
        ),
        // Expanded(
        //   flex: 0,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: const <Widget>[
        //       Padding(
        //         padding: EdgeInsets.only(left: 10, right: 10),
        //         child: Text(":",
        //           style: TextStyle(
        //             color: Colors.black,
        //           ),
        //           textAlign: TextAlign.left,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Expanded(
          flex: flexRightRow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: (contentData != null)
                ? Text("Rp$contentData",
                  style: GoogleFonts.inter(
                     color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700
                  ),
                  textAlign: TextAlign.left,
                )
                : const Text("-",
                  style: TextStyle(
                    color: Colors.black
                  ),
                  textAlign: TextAlign.left,
                )
              ),
            ],
          ),
        )
      ],
    );
  }
}