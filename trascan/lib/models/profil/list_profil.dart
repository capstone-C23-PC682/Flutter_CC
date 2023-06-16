class Dataprofil {
  Dataprofil({
    required this.image,
    required this.id,
    required this.email,
    required this.collection,
    required this.historyid,
    required this.age,
    required this.fname,
    required this.lname,
  });
  late final String image;
  late final String id;
  late final String email;
  late final List<String> collection;
  late final List<String> historyid;
  late final String age;
  late final String fname;
  late final String lname;

  Dataprofil.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
    email = json['email'];
    collection = List.castFrom<dynamic, String>(json['collection']);
    historyid = List.castFrom<dynamic, String>(json['historyid']);
    age = json['age'];
    fname = json['fname'];
    lname = json['lname'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['id'] = id;
    data['email'] = email;
    data['collection'] = collection;
    data['historyid'] = historyid;
    data['age'] = age;
    data['fname'] = fname;
    data['lname'] = lname;
    return data;
  }
}
