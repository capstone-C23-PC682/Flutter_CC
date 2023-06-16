import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trascan/page/home/home.dart';
import '../../service/providers/profil/profil_provider.dart';
import '../login_register/welcome_page.dart';
import '../widgets/alert.dart';
import '../widgets/constanta.dart';
import 'edit_data_akun.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(
      {super.key,
      required this.fname,
      required this.lname,
      required this.history,
      required this.collection,
      required this.image,
      required this.age});
  final String fname;
  final String lname;
  final List history;
  final List collection;
  final String image;
  final String age;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final ImagePicker _imagePicker = ImagePicker();

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Future showAlertDialog(final String label, final Color color,
        final String content, final String label2, final String gambar) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Alert(
              labelButton2: label2,
              titleColor: color,
              contentApproval: content,
              labelButton: label,
              colorButton: color,
              gambar: gambar,
              onClicked: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.remove("token");
                prefs.setBool("login", false);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const WelcomePage())),
                    (route) => false);
                // if (_postProses == "berhasil") {
                //   Get.offAll(const SuratJalanView());
                // }
              },
            );
          });
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color(0xFF43A047),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                                (route) => false);
                          },
                          icon: const Icon(
                            AntDesign.arrowleft,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: height * 0.43,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.72,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    Text(
                                      '${widget.fname} ${widget.lname}',
                                      style: TextStyle(
                                        color: Colors.green[600],
                                        fontSize: 37,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Collection',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              '${widget.collection.length}/5',
                                              style: TextStyle(
                                                color: Colors.green[600],
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 25,
                                            vertical: 8,
                                          ),
                                          child: Container(
                                            height: 50,
                                            width: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Scanning',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              '${widget.history.length}',
                                              style: TextStyle(
                                                color: Colors.green[600],
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                top: 110,
                                right: 20,
                                child: IconButton(
                                    onPressed: () {
                                      showImageSourceDialog(context);
                                    },
                                    icon: Icon(
                                      AntDesign.setting,
                                      color: Colors.grey[700],
                                      size: 30,
                                    ))),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: SizedBox(
                                  width: innerWidth * 0.45,
                                  height: innerWidth * 0.45,
                                  child: ClipOval(
                                    child: widget.image == "null"
                                        ? InteractiveViewer(
                                            child: Image.asset(
                                              'assets/icon/orang.png',
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : InteractiveViewer(
                                            child: Image.network(
                                              widget.image,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          ListTile(
                            tileColor: colorSaldo,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            //contentPadding: EdgeInsets.only(left: 30, right: 30),
                            leading: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: <Color>[
                                      primaryColor,
                                      secondaryColor,
                                    ],
                                    tileMode: TileMode.mirror,
                                  ).createShader(bounds);
                                },
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/icon/person.png"))),
                                )),
                            title: Transform.translate(
                              offset: const Offset(-20, 0),
                              child: const Text(
                                "Ubah Data Akun",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            trailing: Transform.translate(
                              offset: const Offset(-12, 0),
                              child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: <Color>[
                                        primaryColor,
                                        secondaryColor,
                                      ],
                                      tileMode: TileMode.mirror,
                                    ).createShader(bounds);
                                  },
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/icon/kanan.png"))),
                                  )),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => EditAkun(
                                          emailProfile: widget.lname,
                                          namaProfile: widget.fname,
                                          noProfile: widget.age.toString(),
                                          pass: widget.fname,
                                          gam: widget.image))));
                            },
                          ),
                          ListTile(
                            tileColor: colorSaldo,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            //contentPadding: EdgeInsets.only(left: 30, right: 30),
                            leading: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: <Color>[
                                      primaryColor,
                                      secondaryColor,
                                    ],
                                    tileMode: TileMode.mirror,
                                  ).createShader(bounds);
                                },
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/icon/logout.png"))),
                                )),
                            title: Transform.translate(
                              offset: const Offset(-20, 0),
                              child: const Text(
                                "Keluar",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            trailing: Transform.translate(
                              offset: const Offset(-12, 0),
                              child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: <Color>[
                                        primaryColor,
                                        secondaryColor,
                                      ],
                                      tileMode: TileMode.mirror,
                                    ).createShader(bounds);
                                  },
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/icon/kanan.png"))),
                                  )),
                            ),
                            onTap: () {
                              showAlertDialog(
                                  "Tidak",
                                  const Color(0xFF43A047),
                                  "Apakah Kamu Yakin Ingin Keluar?",
                                  "Iya",
                                  "assets/icon/amico.png");
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Take a Photo"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Choose from Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.arrow_back),
                title: const Text("Go Back"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void pickImage(ImageSource source) async {
    final pickedImage = await _imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      final profilProvider =
          Provider.of<ProfilProvider>(context, listen: false);
      profilProvider.updateGambar(File(pickedImage.path));
    }
  }
}
