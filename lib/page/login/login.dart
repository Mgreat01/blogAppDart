import 'package:blog_mobile/page/login/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blog_mobile/page/login/LoginController.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {

    var state = ref.watch(loginCrtlProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.lock,
              size: 100,
              color: Colors.teal,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                label: Text('adresse mail'),
                hintText: 'Adresse Mail',
                prefixIcon: Icon(Icons.email), // Icône pour le champ
                border: OutlineInputBorder(),
                filled: true, // Ajouter un fond
                fillColor: Colors.grey[200],
              ),
              onChanged: (newEmail) {},
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Mot de Passe',
                prefixIcon: Icon(Icons.lock), // Icône pour le champ
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var ctrl = ref.read(loginCrtlProvider.notifier);
                ctrl.soumettreFormulaire();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Couleur du bouton
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Connexion',
                style: TextStyle(fontSize: 16),
              ),
            ),
            TextButton(
              onPressed: () {

              },
              child: Text(
                " Inscrivez-vous",
                style: TextStyle(color: Colors.teal),
              ),
            ),
          ],
        )
      ),
    );

  }
}
