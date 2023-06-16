import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trascan/shared/shared.dart';

class ButtonCostume extends StatelessWidget {
  final Function() onClickedShare;
  final Function() onClickedUnduh;
  final Function() onClickedLagi;
  const ButtonCostume({
    Key? key,
    required this.onClickedShare,
    required this.onClickedUnduh,
    required this.onClickedLagi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                  onPressed: onClickedShare,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: whiteColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: primaryColor, width: 1.5),
                          borderRadius: BorderRadius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icon/share.png",
                          height: 24,
                          width: 24,
                        ),
                        Text('Bagikan',
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: primaryColor)),
                      ],
                    ),
                  )),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                  onPressed: onClickedUnduh,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: whiteColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: primaryColor, width: 1.5),
                          borderRadius: BorderRadius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icon/download.png",
                          height: 24,
                          width: 24,
                        ),
                        Text('Unduh',
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: primaryColor)),
                      ],
                    ),
                  )),
            ),
          ],
        ),
        const SizedBox(height: 15),
        ElevatedButton(
            onPressed: onClickedLagi,
            style: ElevatedButton.styleFrom(
                backgroundColor: whiteColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: primaryColor, width: 1.5),
                    borderRadius: BorderRadius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text('Transaksi lagi ke tujuan ini',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: primaryColor)),
            )),
      ],
    );
  }
}
