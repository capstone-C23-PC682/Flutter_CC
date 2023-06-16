import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trascan/models/history.dart';

import 'package:trascan/page/widgets/finite_state.dart';
import 'package:trascan/service/database/myCuan_Api.dart';

class RiwayatProvider extends ChangeNotifier {
  final MyCuanAPI service = MyCuanAPI();

  Historys? riwayat;

  MyState myState = MyState.loading;

  Future fetchRiwayat() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      riwayat = (await service.getHistory());

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
}
