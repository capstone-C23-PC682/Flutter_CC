import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../models/profil/list_profil.dart';
import '../../../page/widgets/finite_state.dart';
import '../../database/myCuan_Api.dart';

class ProfilProvider extends ChangeNotifier {
  final MyCuanAPI service = MyCuanAPI();

  Dataprofil? profil;
  // ignore: unused_field
  String _isNext = "";

  MyState myState = MyState.loading;

  Future fetchProfil() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      profil = await service.getProfil();

      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        /// If want to check status code from service error
        e.response!.statusCode;
      }

      myState = MyState.failed;
      notifyListeners();
    }
  }

  void updateProfil(
    String fname,
    String lname,
    String age,
  ) async {
    try {
      final result = await MyCuanAPI().updateUser(
        fname,
        lname,
        age,
      );
      _isNext = "berhasil";
      print("dijalankan");
      print(result);
    } catch (e) {
      _isNext = "gagal";
    }
    notifyListeners();
  }

  MyState gambarState = MyState.initial;

  void updateGambar(
    File gambar,
  ) async {
    try {
      gambarState = MyState.loading;
      notifyListeners();

      final result = await MyCuanAPI().updateGambar(gambar);
      _isNext = "berhasil";
      print("dijalankan");
      print(result);

      gambarState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      gambarState = MyState.failed;
      notifyListeners();
    }
  }

  @override
  notifyListeners();

  void updateGambarML(
    File gambar,
  ) async {
    try {
      final result = await MyCuanAPI().updateGambarML(gambar);
      _isNext = "berhasil";
      print("dijalankan");
      print(result);
    } catch (e) {
      _isNext = "gagal";
    }
    notifyListeners();
  }
}
