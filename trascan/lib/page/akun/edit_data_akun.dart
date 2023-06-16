// ignore_for_file: unused_import

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trascan/page/home/home.dart';
import 'package:trascan/page/main_page/main_page.dart';
import 'package:trascan/page/widgets/alert.dart';
import 'package:badges/badges.dart' as badges;
import 'package:trascan/service/providers/profil/profil_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trascan/shared/shared.dart';
import 'package:provider/provider.dart';

class EditAkun extends StatefulWidget {
  const EditAkun(
      {super.key,
      required this.emailProfile,
      required this.namaProfile,
      required this.noProfile,
      required this.pass,
      required this.gam});
  final String emailProfile;
  final String namaProfile;
  final String noProfile;
  final String pass;
  final String gam;
  @override
  State<EditAkun> createState() => _EditAkunState();
}

class _EditAkunState extends State<EditAkun> {
  final formKey = GlobalKey<FormState>();
  final _namalengkapController = TextEditingController();
  final _emailController = TextEditingController();
  final _nomortelponController = TextEditingController();
  FilePickerResult? result;
  late File display;
  @override
  void initState() {
    _namalengkapController.text = widget.namaProfile;
    _emailController.text = widget.emailProfile;
    _nomortelponController.text = widget.noProfile;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future showAlertDialog(
        final String label,
        final Color color,
        final String content,
        final String label2,
        final String gambar,
        String a,
        String b,
        String c) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Consumer<ProfilProvider>(
              builder: (context, provider, _) {
                return Alert(
                  labelButton2: label2,
                  titleColor: color,
                  contentApproval: content,
                  labelButton: label,
                  colorButton: color,
                  gambar: gambar,
                  onClicked: () async {
                    provider.updateProfil(a, b, c);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
                  },
                );
              },
            );
          });
    }

    double heightt = MediaQuery.of(context).size.height;
    double widthh = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: whiteColor,
        title: Text(
          "Ubah Data Akun",
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(
                left: widthh * 16 / 360, right: widthh * 16 / 360),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: heightt * 16 / 800,
                    ),
                    Text(
                      "First Name",
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: heightt * 0.00625,
                    ),
                    TextFormField(
                        //keyboardType: TextInputType.text,
                        controller: _namalengkapController,
                        validator: (value) {
                          //final nameRegExp = new RegExp(r"^\s([A-Za-z]{1,}([.,] |[-']| ))+[A-Za-z]+.?\s$");
                          if (value!.isEmpty) {
                            return "Harus diisi";
                          }
                          return null; //else if (!nameRegExp.hasMatch(value)) {
                          //   return 'Nama tidak boleh angka';
                          // }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: "Nama Lengkap",
                          // labelText: "Nama Lengkap",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(heightt * 12 / 800),
                            child: Image.asset(
                              "assets/icon/person.png",
                              height: 10,
                              width: 10,
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(heightt * 13 / 800),
                            child: Image.asset(
                              "assets/icon/edit.png",
                              height: 10,
                              width: 10,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: heightt * 0.0225,
                    ),

                    Text(
                      "Last Name",
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: heightt * 0.00625,
                    ),
                    TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Harus diisi";
                          }
                          return null;
                        },
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: "Nama Terakhir ",
                          //  labelText: "emailkamu@gmail.com",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(heightt * 12 / 800),
                            child: Image.asset(
                              "assets/icon/person.png",
                              height: 10,
                              width: 10,
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(heightt * 13 / 800),
                            child: Image.asset(
                              "assets/icon/edit.png",
                              height: 10,
                              width: 10,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: heightt * 0.0225,
                    ),
                    Text(
                      "Age",
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: heightt * 0.00625,
                    ),
                    TextFormField(
                        controller: _nomortelponController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Harus diisi";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: "Nomor Aktif Kamu",
                          // labelText: "Nomor Aktif Kamu",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(heightt * 12 / 800),
                            child: Image.asset(
                              "assets/icon/hp.png",
                              height: 10,
                              width: 10,
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(heightt * 13 / 800),
                            child: Image.asset(
                              "assets/icon/edit.png",
                              height: 10,
                              width: 10,
                            ),
                          ),
                        )),
                    // SizedBox(
                    //   height:heightt* 5/800,
                    // ),
                    SizedBox(
                      height: heightt * 0.0225,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: heightt * 160 / 800),
                      child: SizedBox(
                        height: heightt * 0.06,
                        width: widthh * 0.911,
                        child: ElevatedButton(
                            onPressed: () {
                              final isValidForm =
                                  formKey.currentState!.validate();
                              if (isValidForm) {
                                showAlertDialog(
                                    "Kembali",
                                    primaryColor,
                                    "Yeey, Profil berhasil diperbarui!",
                                    "Selesai",
                                    "assets/icon/cuate.png",
                                    _namalengkapController.text,
                                    _emailController.text,
                                    _nomortelponController.text);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: Text(
                              'Simpan Perubahan',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: whiteColor),
                            )),
                      ),
                    ),
                    // Text(
                    //   "Isi dengan nomor kamu yang masih aktif ya",
                    //   style: dengerTextStyle.copyWith(fontSize: 12),
                    //   textAlign: TextAlign.start,
                    // ),
                    // SizedBox(
                    //   height: heightt * 0.125,
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
