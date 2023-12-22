import 'package:crud/providers/user_provider.dart';
import 'package:crud/screens/home_screen.dart';
import 'package:crud/screens/user_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        title: 'Estudo CRUD',
        home: const HomeScreen(),
        routes: {
          "/create": (_) => const HomeScreen(),
          "/list": (_) => const UserListScreen(),
        },
      ),
    );
  }
}
