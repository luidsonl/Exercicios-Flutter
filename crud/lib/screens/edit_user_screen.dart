import 'package:crud/widgets/user_form.dart';
import 'package:flutter/material.dart';

class EditUserScreen extends StatelessWidget {
  const EditUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit User'),
        actions: [
          TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
              child: const Text('User List')),
        ],
      ),
      body: const Center(
        child: UserForm(),
      ),
    );
  }
}
