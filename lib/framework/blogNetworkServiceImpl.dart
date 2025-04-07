import 'dart:convert';

import 'package:blog_mobile/business/models/Authentification.dart';
import 'package:blog_mobile/business/models/user.dart';
import 'package:blog_mobile/business/services/blogNetworkService.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../business/models/article.dart';
class BlogNetworkServiceImpl implements BlogNetworkService{
  @override
  Future<User> authentifier(Authentification data) async {

    var url = Uri.parse("http://127.0.0.1:8000/api/tout");
    var body = jsonEncode(data.toJson());
    var response = await http.post(
        url ,
        body: body,
        headers: {"content-type": "application/json"}

    );

    print(response.statusCode);
    var codes = [200, 201];
    var resultat = jsonDecode(response.body) as Map;

    if (!codes.contains(response.statusCode)) {
      var error = resultat["error"];
      throw Exception(error);
    }
    var user = User.fromMap(resultat);
    return user;
  }
  @override
  Future<List<Article>> recupererArticle() async {
    var url = Uri.parse("http://10.252.252.43:8000/api/articles");


    var response = await http.get(url);
    print("Réponse brute de l'API : ${response.body}");


    if (response.statusCode == 200) {
     // List<dynamic> jsonResponse = jsonDecode(response.body);
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      List<dynamic> articlesData = jsonResponse['data'];

      return articlesData.map((article) => Article.fromMap(article)).toList();
      //return jsonResponse.map((article) => Article.fromMap(article)).toList();
    } else {
      throw Exception("Erreur lors de la récupération des articles");
    }

  }

  @override
  Future<void> liker(int articleId) async {
    var url = Uri.parse("http://10.252.252.43:8000/api/likess");
    var token = "11|Km59GUQefoybstfR7Sz3D1CL2486MpiMAvwyXCDve871f50f"; // À remplacer
    var response = await http.post(
      url,
      body: jsonEncode({'articleId': articleId}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception("Échec du like: ${response.body}");
    }
  }
}





/*void main() async{
  var formulaire = Authentification(
      email: "test@gmail.com",
      password: "123456"
  );

  var service = BlogNetworkServiceImpl();
  var user = await service.authentifier(formulaire);
  print(user.name);
}*/
void main() async{
  // var formulaire = Authentication(email: "ephraimmonga5@gmail.com", password: "123456");
  var service =  BlogNetworkServiceImpl();
  var user = await service.recupererArticle();
  print(user);
}