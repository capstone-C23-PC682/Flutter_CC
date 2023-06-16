import 'package:flutter/material.dart';
import 'package:trascan/page/widgets/button_alert.dart';
import 'package:trascan/page/widgets/button_confrim.dart';
import 'package:trascan/page/widgets/constanta.dart';

class Alert extends StatelessWidget {
  final String labelButton;
  final Color colorButton;
  final VoidCallback onClicked;
  final String labelButton2;
  final Color titleColor;
  final String contentApproval;
  final String gambar;
  const Alert(
      {Key? key,
      required this.labelButton,
      required this.colorButton,
      required this.onClicked,
      required this.titleColor,
      required this.contentApproval,
      required this.gambar,
      required this.labelButton2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightt = MediaQuery.of(context).size.height;
    double widthh = MediaQuery.of(context).size.width;
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: SizedBox(
        height: heightt * 340 / 800,
        width: widthh * 320 / 360,
        child: Column(
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.only(top: 15),
            //   child: Text(
            //     title,
            //     style: TextStyle(
            //       fontSize: 18,
            //       color: titleColor,
            //       fontWeight: FontWeight.w700
            //     ),
            //   ),
            // ),
            SizedBox(height: heightt * 32 / 800),
            SizedBox(
              height: heightt * 160 / 800,
              width: widthh * 150 / 360,
              child: Image.asset(gambar),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: heightt * 5 / 800,
                  bottom: heightt * 5 / 800,
                  left: widthh * 10 / 360,
                  right: widthh * 10 / 360),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widthh * 10 / 360,
                    vertical: heightt * 10 / 800),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        contentApproval,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widthh * 10 / 360, vertical: heightt * 10 / 800),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ButtonAlert(
                          label: labelButton,
                          colorisi: primaryColor,
                          onClicked: () {
                            Navigator.pop(context);
                          })),
                  SizedBox(width: widthh * 10 / 360),
                  Expanded(
                      child: ButtonConfrim(
                          label: labelButton2,
                          colorisi: primaryColor,
                          onClicked: onClicked)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
