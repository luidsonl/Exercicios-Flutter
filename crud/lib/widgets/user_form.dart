import 'package:crud/widgets/field_form.dart';
import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FieldForm(
              label: 'Name', isPassword: false, controller: controllerName),
          FieldForm(
              label: 'Email', isPassword: false, controller: controllerEmail),
          FieldForm(
              label: 'Password',
              isPassword: true,
              controller: controllerPassword),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              child: const Text('Salvar'),
            ),
          )
        ],
      ),
    );
  }
}
