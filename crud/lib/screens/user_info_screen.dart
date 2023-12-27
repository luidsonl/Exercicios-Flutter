import 'package:crud/widgets/container_all.dart';
import 'package:crud/widgets/user_info.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User info'),
      ),
      body: ContainerAll(child: const UserInfo()),
    );
  }
}
