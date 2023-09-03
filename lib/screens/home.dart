import 'package:flutter/material.dart';
import 'package:ept_frontend/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Educar Para Transformar'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(Icons.person),
            label: const Text('Logout'),
            onPressed: () async {
              await _auth.logout();
            },
          ),
        ],
      ),
    );
  }
}
