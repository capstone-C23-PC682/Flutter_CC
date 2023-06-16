import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:trascan/models/login/data_register_model.dart';
import 'package:trascan/page/login_register/login_page.dart';
import 'package:trascan/page/login_register/register2_page.dart';
import 'package:provider/provider.dart';

import '../../shared/shared.dart';
import '../../view_model/auth_view_model.dart';

class Register1Page extends StatefulWidget {
  const Register1Page({super.key});

  @override
  State<Register1Page> createState() => _Register1PageState();
}

class _Register1PageState extends State<Register1Page> {
  final formKey = GlobalKey<FormState>();
  final _namalengkapController = TextEditingController();
  final _namalengkapController2 = TextEditingController();
  final _emailController = TextEditingController();
  final _nomortelponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(color: blackColor),
        centerTitle: true,
        title: Text(
          "Daftar",
          style: dengerTextStyle.copyWith(fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(
                right: Size.width * 0.044, left: Size.width * 0.044),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Size.height * 0.02,
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      width: 150,
                      lineHeight: 10,
                      animation: true,
                      percent: 50 / 100,
                      animationDuration: 1000,
                      progressColor: Colors.green[600],
                      barRadius: const Radius.circular(10),
                    ),
                    SizedBox(
                      height: Size.height * 0.01,
                    ),
                    Text(
                      "Langkah 1 dari 2",
                      style: blackTextStyle.copyWith(fontSize: 12),
                    ),
                    SizedBox(
                      height: Size.height * 0.01,
                    ),
                    Text(
                      "Ayo gabung ke Trascan!",
                      style: blackTextStyle.copyWith(fontSize: 22),
                    ),
                    SizedBox(
                      height: Size.height * 0.025,
                    ),
                    Text(
                      "Nama Depan",
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: Size.height * 0.00625,
                    ),
                    TextFormField(
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
                          hintText: "Nama Depan",
                          labelText: "Nama Depan",
                        )),
                    SizedBox(
                      height: Size.height * 0.0225,
                    ),
                    Text(
                      "Nama Belakang",
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: Size.height * 0.00625,
                    ),
                    TextFormField(
                        controller: _namalengkapController2,
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
                          hintText: "Nama Belakang",
                          labelText: "Nama Belakang",
                        )),
                    SizedBox(
                      height: Size.height * 0.0225,
                    ),
                    Text(
                      "Alamat Email",
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: Size.height * 0.00625,
                    ),
                    TextFormField(
                        controller: _emailController,
                        validator: (email) {
                          if (email != null &&
                              !EmailValidator.validate(email)) {
                            return "email tidak valid";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: "emailkamu@gmail.com",
                          labelText: "emailkamu@gmail.com",
                        )),
                    SizedBox(
                      height: Size.height * 0.0225,
                    ),
                    Text(
                      "Umur",
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: Size.height * 0.00625,
                    ),
                    TextFormField(
                        controller: _nomortelponController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Harus diisi";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: "Umur Kamu Tahun Ini",
                          labelText: "Umur Kamu Tahun Ini",
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: Size.height * 0.05,
                    ),
                    SizedBox(
                      height: Size.height * 0.06,
                      width: Size.width * 0.911,
                      child: ElevatedButton(
                          onPressed: () {
                            final isValidForm =
                                formKey.currentState!.validate();
                            if (isValidForm) {
                              final users = Register1Model(
                                  fname: _namalengkapController.text,
                                  lname: _namalengkapController2.text,
                                  email: _emailController.text,
                                  age: _nomortelponController.text);
                              Provider.of<AuthViewModel>(context, listen: false)
                                  .saveData1(users);

                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Register2Page(
                                  register1model: users,
                                ),
                              ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[600],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: Text(
                            'Lanjut',
                            style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: whiteColor),
                          )),
                    ),
                    SizedBox(
                      height: Size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah punya akun?",
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                        SizedBox(
                          width: Size.width * 0.022,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ));
                            },
                            child: Text(
                              "Masuk",
                              style: primaryTextStyle.copyWith(fontSize: 16),
                            )),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
