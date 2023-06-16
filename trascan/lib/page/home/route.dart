import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trascan/models/profil/list_profil.dart';
import 'package:trascan/page/home/collection.dart';
import 'package:trascan/page/home/history.dart';
import 'package:trascan/page/home/home.dart';
import 'package:trascan/page/home/productdetail.dart';

import '../../service/providers/profil/profil_provider.dart';
import '../akun/profile.dart';

class RouteDart extends StatefulWidget {
  const RouteDart({Key? key, required this.numbers, required this.data})
      : super(key: key);

  final int numbers;
  final Dataprofil data;

  @override
  State<RouteDart> createState() => _RouteDartState();
}

class _RouteDartState extends State<RouteDart> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    navigate(context);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigate(context);
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<void> navigate(BuildContext context) async {
    if (widget.numbers == 4) {
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => ProfileScreen(
            age: widget.data.age,
            fname: widget.data.fname,
            lname: widget.data.lname,
            history: widget.data.historyid,
            collection: widget.data.collection,
            image: widget.data.image,
          ),
        ),
        (route) => false,
      );
    } else if (widget.numbers == 2) {
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Takehistroy()),
        (route) => false,
      );
    } else if (widget.numbers == 3) {
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => Collectionproduct(
                  collector: widget.data,
                )),
        (route) => false,
      );
    } else {
      showImageSourceDialog(context);
    }
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
                  pickImage(ImageSource.camera, context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Choose from Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery, context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.arrow_back),
                title: const Text("Go Back"),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void pickImage(ImageSource source, BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text("Loading"),
          content: CircularProgressIndicator(),
        );
      },
    );

    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      final profilProvider =
          Provider.of<ProfilProvider>(context, listen: false);

      try {
        final predictedClass =
            profilProvider.updateGambarML(File(pickedImage.path));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detailgarbage(
              keadaan: 2,
              id: predictedClass as String,
            ),
          ),
        );
      } catch (error) {
        // Handle any error that occurred during the API request
        print(error);
        // You can display an error message or handle it as per your requirement
      }
    } else {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pop(context);
    }
  }
}
