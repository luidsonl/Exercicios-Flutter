import 'package:crud/models/user.dart';
import 'package:crud/providers/user_provider.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    final selectedUserId = userProvider.formAction.selectedUserId;
    final users = userProvider.users;

    User? selectedUser = users.firstWhere(
      (user) => user.id == selectedUserId,
      orElse: () => User(
          id: -1, name: "Não encontrado", email: "email", password: "password"),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16, left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Name:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(selectedUser.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                    )),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16, left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'E-mail:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(selectedUser.email,
                    style: const TextStyle(
                      fontSize: 16.0,
                    )),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16, left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Password:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(selectedUser.password,
                    style: const TextStyle(
                      fontSize: 16.0,
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
