// lib/screens/home_screen.dart
import 'package:crud/widgets/container_all.dart';
import 'package:crud/widgets/user_form.dart';
import 'package:flutter/material.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Esta linha volta para a tela anterior
          },
        ),
      ),
      body: ContainerAll(
        child: const UserForm(),
      ),
    );
  }
}
