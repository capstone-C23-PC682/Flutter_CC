class Historys {
  final String status;
  final List<MyData> data;

  Historys({required this.status, required this.data});

  factory Historys.fromJson(Map<String, dynamic> json) {
    final List<dynamic> dataList = json['data'];
    final List<MyData> myDataList = dataList
        .map((data) => MyData.fromJson(data as Map<String, dynamic>))
        .toList();

    return Historys(
      status: json['status'],
      data: myDataList,
    );
  }
}

class MyData {
  final String data;
  final String userId;
  final String status;
  final RegisterAt registerAt;

  MyData({
    required this.data,
    required this.userId,
    required this.status,
    required this.registerAt,
  });

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      data: json['data'],
      userId: json['userId'],
      status: json['status'],
      registerAt: RegisterAt.fromJson(json['registerat']),
    );
  }
}

class RegisterAt {
  final int seconds;
  final int nanoseconds;

  RegisterAt({required this.seconds, required this.nanoseconds});

  factory RegisterAt.fromJson(Map<String, dynamic> json) {
    return RegisterAt(
      seconds: json['_seconds'],
      nanoseconds: json['_nanoseconds'],
    );
  }

  DateTime toDate() {
    return DateTime.fromMillisecondsSinceEpoch(
      seconds * 1000 + (nanoseconds / 1000000).round(),
    );
  }
}
