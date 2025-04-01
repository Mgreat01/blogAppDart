import 'package:flutter/material.dart';
import 'package:blog_mobile/business/models/article.dart';

import 'articleComposant.dart';


class CarteArticles extends StatelessWidget {
  final Article article;

  const CarteArticles(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        leading: CircleAvatar(
          backgroundImage: article.photo != null && article.photo!.isNotEmpty
              ? NetworkImage(article.photo!)
              : AssetImage('assets/default.jpg') as ImageProvider,
          radius: 30,
        ),
        title: Text(
          article.title ?? 'Sans titre',
          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.auteur ?? 'Auteur inconnu',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            SizedBox(height: 5),
            Text(
              article.dateCreation ?? 'Date inconnue',
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
            SizedBox(height: 5),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailArticlePage(article: article),
                  ),
                );
              },
              child: Text(
                'Lire plus...',
                style: TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CarteArticle(),
              ),
            );
          },
        ),
      ),
    );
  }
}
