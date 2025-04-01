import 'package:flutter/material.dart';

import 'otherArticle.dart';

class CarteArticle extends StatelessWidget {
  final String? title;
  final String? slug;
  final String? photo;
  final String? auteur;
  final String? commentaire;
  final String? dateCreation;

  const CarteArticle({
    Key? key,
    this.title,
    this.slug,
    this.photo,
    this.auteur,
    this.commentaire,
    this.dateCreation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        leading: CircleAvatar(
          backgroundImage: photo != null ? NetworkImage(photo!) : null,
          radius: 30,
          backgroundColor: Colors.grey,
        ),
        title: Text(
          title ?? 'Sans titre',
          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (auteur != null)
              Text(
                'Auteur: $auteur',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            if (dateCreation != null)
              Text(
                'Date: $dateCreation',
                style: const TextStyle(color: Colors.white54, fontSize: 10),
              ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () {},
              child: const Text(
                'Lire plus...',
                style: TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CarteArticles(),
              ),
            );
          },
        ),
      ),
    );
  }
}

