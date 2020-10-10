import 'package:de_koffie_manager/models/brew.dart';
import 'package:de_koffie_manager/screens/home/brew_list.dart';
import 'package:de_koffie_manager/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:de_koffie_manager/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Koffie manager'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('logout'),
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
