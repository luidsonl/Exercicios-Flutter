import 'package:crud/providers/user_provider.dart';
import 'package:crud/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: const MaterialApp(
        title: 'Estudo CRUD',
        home: HomeScreen(),
        routes: {},
      ),
    );
  }
}
