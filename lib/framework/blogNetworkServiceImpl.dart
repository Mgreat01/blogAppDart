import 'dart:convert';

import 'package:blog_mobile/business/models/authentification.dart';
import 'package:blog_mobile/business/models/user.dart';
import 'package:blog_mobile/business/services/blogNetworkService.dart';
import 'package:http/http.dart' as http;

class BlogNetworkserviceimpl implements BlogNetworkService {
  @override
  Future<User> authentifier(Authentication data) async {
   var url = Uri.parse("http://10.252.252.46:8000/api/login");
   var body = jsonEncode(data.toJson());
   var response = await http.post(
     url,
     body: jsonEncode(data.toJson()),
     headers: {"Content-Type": "application/json"},
   );
  print(response.statusCode);
  print(response.body);
  var codes = [200,201];
  var resultat = jsonDecode(response.body) as Map;

  if(!codes.contains(response.statusCode)){
    var error = resultat["error"];
    throw Exception(error);
  }


   //var jsonData = jsonDecode(response.body)["data"];
   var user = User.fromMap(resultat);

   return user;
  }
}

void main() async {
  var formulaire = Authentication(
      email: "test@gmail.com",
      password: "123456"

  );
  var service = BlogNetworkserviceimpl();
  var user = await service.authentifier(formulaire);
  print(user.toMap());
}