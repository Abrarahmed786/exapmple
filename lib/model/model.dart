import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Data> fetchData() async {
  final response =
      await http.get(Uri.parse('https://myjson.dit.upm.es/api/bins/gbt5'));

  if (response.statusCode == 200) {
    return Data.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Data {
  Data({
    required this.profilePic,
    required this.name,
    required this.emailId,
  });

  String profilePic;
  String name;
  String emailId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        profilePic: json["data"]["profile_pic"],
        name: json["data"]["name"],
        emailId: json["data"]["email_id"],
      );

  Map<String, dynamic> toJson() => {
        "profile_pic": profilePic,
        "name": name,
        "email_id": emailId,
      };
}
