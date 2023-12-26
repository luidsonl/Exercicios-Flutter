import 'package:crud/widgets/user_list.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/create');
              },
              child: const Text('New User')),
        ],
      ),
      body: const Center(
        child: UserList(),
      ),
    );
  }
}
