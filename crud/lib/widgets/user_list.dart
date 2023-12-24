import 'package:crud/models/user.dart';
import 'package:crud/providers/user_provider.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;
    List<User> users = userProvider.users;

    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext contextBuilder, indexBuilder) => Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.3))),
              child: ListTile(
                title: Text(users[indexBuilder].name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          userProvider.selectedUser = users[indexBuilder];
                          Navigator.pushNamed(context, '/edit');
                        },
                        icon: const Icon(Icons.edit))
                  ],
                ),
              ),
            ));
  }
}
