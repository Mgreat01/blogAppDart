
import 'Auteur.dart';
import 'category.dart';

class Article {
  int id;
  String? title;
  Auteur? auteur;
  String? slug;
  String? photo;
  String? content;
  int? nbr_comment;
  int? nb_Likes;
  List<Category>? category;
  List<dynamic>? tag;
  String? date_creation;
  String? last_modif;

  Article({
    required this.id,
    this.title,
    this.auteur,
    this.slug,
    this.photo,
    this.content,
    this.nbr_comment,
    this.nb_Likes,
    this.category,
    this.tag,
    this.date_creation,
    this.last_modif,
  });


  factory Article.fromMap(Map<String, dynamic> json) => Article(
    id: json["id"],
    title: json["title"],
    auteur: json["auteur"] != null ? Auteur.fromMap(json["auteur"]) : null,
    slug: json["slug"],
    photo: json["photo"],
    content: json["content"],
    nbr_comment: json["nbr_comment"],
    nb_Likes: json["nb_likes"],
    category: json["category"] == null ? [] : List<Category>.from(json["category"]!.map((x) => Category.fromMap(x))),
    tag: json["tag"] == null ? [] : List<dynamic>.from(json["tag"]!.map((x) => x)),
    date_creation: json["date_creation"],
    last_modif: json["lastmodif"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "auteur":auteur,
    "slug": slug,
    "photo": photo,
    "content": content,
    "nbr_comment": nbr_comment,
    "nb_likes": nb_Likes,
    "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x.toMap())),
    "tag": tag == null ? [] : List<dynamic>.from(tag!.map((x) => x)),
    "date_creation": date_creation,
    "lastmodif": last_modif,
  };

}