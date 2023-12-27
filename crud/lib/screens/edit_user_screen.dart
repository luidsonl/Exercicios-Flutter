import 'package:crud/widgets/container_all.dart';
import 'package:crud/widgets/delete_button.dart';
import 'package:crud/widgets/user_form.dart';
import 'package:flutter/material.dart';

class EditUserScreen extends StatelessWidget {
  const EditUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Edit User'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: ContainerAll(
          child: const Column(
            children: [
              UserForm(),
              DeleteButton(),
            ],
          ),
        ));
  }
}
