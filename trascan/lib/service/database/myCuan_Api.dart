import 'dart:io';
import 'package:dio/dio.dart';
import 'package:trascan/models/history.dart';

import 'package:trascan/models/profil/list_profil.dart';

import 'package:shared_preferences/shared_preferences.dart';

final _dio = Dio(
  BaseOptions(
    baseUrl: 'https://garbageapi-y5pgssqvcq-et.a.run.app/',
  ),
);

class MyCuanAPI {
  MyCuanAPI() {
    _dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    );
  }
  String _isNext = "";
  String get isNext => _isNext;

  Future<Dataprofil> getProfil() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? "";
    try {
      final response = await _dio.get('/get-data',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print(response.data);
      print(response.statusCode);
      _isNext = "berhasil";
      Dataprofil dataProfil = Dataprofil.fromJson(response.data['data']);
      return dataProfil;
    } on DioError catch (e) {
      print(e.response!.data['message']);
      print('data bermasalah');
      _isNext = "gagal";
      rethrow;
    }
  }

  Future<Historys> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? "";
    try {
      final response = await _dio.get('/get-history',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print(response.data);
      print(response.statusCode);
      _isNext = "berhasil";
      Historys datariwayat = Historys.fromJson(response.data);
      return datariwayat;
    } on DioError catch (e) {
      print(e.response!.data['message']);
      print('data bermasalah');
      _isNext = "gagal";
      rethrow;
    }
  }

  Future updateUser(
    String fname,
    String lname,
    String age,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? "";
    try {
      final response = await _dio.put('/update',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }),
          data: {
            "fname": fname,
            "lname": lname,
            "age": age,
          });
      Dataprofil dataProfilUpdate = Dataprofil.fromJson(response.data);

      _isNext = "berhasil";
      print(dataProfilUpdate);
      return dataProfilUpdate;
    } on DioError catch (e) {
      print(e.response!.data['message']);
      print('data bermasalah');
      _isNext = "gagal";
      rethrow;
    }
  }

  Future updateGambar(
    File gambar,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? "";

    try {
      String fileName = gambar.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(gambar.path, filename: fileName),
      });
      final response = await _dio.post('/user/image',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }),
          data: formData);
      //DataProfil dataProfilUpdate = DataProfil.fromJson(response.data);

      _isNext = "berhasil";
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      print(e.response!.data['message']);
      print('data bermasalah');
      _isNext = "gagal";
      rethrow;
    }
  }

  Future<String> updateGambarML(File gambar) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? "";

    try {
      String fileName = gambar.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(gambar.path, filename: fileName),
      });

      final response = await _dio.post(
        'https://us-central1-capstone-c23-pc682.cloudfunctions.net/predict',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
        data: formData,
      );

      _isNext = "berhasil";
      print(response.data);

      final String predictedClass = response.data['class'];
      return predictedClass;
    } on DioError catch (e) {
      print(e.response!.data['message']);
      print('data bermasalah');
      _isNext = "gagal";
      rethrow;
    }
  }

  Future getToken(String email, String password) async {
    try {
      final response = await _dio
          .post('/login', data: {"email": email, "password": password});
      return response.data['token'];
    } catch (e) {
      rethrow;
    }
  }
}
