import 'package:crud/models/user.dart';
import 'package:crud/providers/user_provider.dart';
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
    void save() {
      UserProvider userProvider = UserProvider.of(context) as UserProvider;

      User user = User(
          name: controllerName.text,
          email: controllerEmail.text,
          password: controllerPassword.text);

      userProvider.users.insert(userProvider.users.length, user);

      controllerName.clear();
      controllerEmail.clear();
      controllerPassword.clear();

      Navigator.pushNamed(context, '/list');
    }

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
              onPressed: save,
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
