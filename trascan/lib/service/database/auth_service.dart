import 'package:dio/dio.dart';
import 'package:trascan/models/login/register_model.dart';

final _dio = Dio(
  BaseOptions(
    baseUrl: 'https://garbageapi-y5pgssqvcq-et.a.run.app',
  ),
);

class RegisterDioService {
  RegisterDioService() {
    _dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    );
  }
  String _isNext = "";
  String get isNext => _isNext;

  Future<Data> getAllRegister(String fname, String lname, String age,
      String email, String password) async {
    try {
      final options = Options(
        sendTimeout: 10000, // Timeout in milliseconds
      );

      final response = await _dio.post('/signup',
          data: {
            "fname": fname,
            "lname": lname,
            "age": age,
            "email": email,
            "password": password,
          },
          options: options);

      _isNext = "berhasil";
      return response.data['status'];
    } on DioError catch (e) {
      print(e.response!.data['status']);
      // print('data bermasalah');
      _isNext = "gagal";
      rethrow;
    }
  }

  Future getToken(String email, String password) async {
    try {
      final response = await _dio
          .post('/login', data: {"email": email, "password": password});

      return response.data['token'];
    } on DioError {
      rethrow;
    }
  }
}
