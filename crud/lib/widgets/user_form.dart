import 'package:crud/models/form_action.dart';
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
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    String action = userProvider.formAction.actionName;
    int? selectedUserId = userProvider.formAction.selectedUserId;
    final users = userProvider.users;

    userProvider.formAction.actionName = 'create';

    User? selectedUser = users.firstWhere(
      (user) => user.id == selectedUserId,
      orElse: () => User(id: -1, name: '', email: '', password: ''),
    );

    if (action == 'edit') {
      controllerName.text = selectedUser.name;
      controllerEmail.text = selectedUser.email;
      controllerPassword.text = selectedUser.password;
    }

    void save() {
      User? user;
      switch (action) {
        case 'create':
          user = User.autoIncrement(
              name: controllerName.text,
              email: controllerEmail.text,
              password: controllerPassword.text);
          userProvider.users.add(user);
          break;
        case 'edit':
          selectedUser.name = controllerName.text;
          selectedUser.email = controllerEmail.text;
          selectedUser.password = controllerPassword.text;
          break;
      }

      controllerName.clear();
      controllerEmail.clear();
      controllerPassword.clear();

      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
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
