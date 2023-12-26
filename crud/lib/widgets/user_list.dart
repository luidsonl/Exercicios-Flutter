import 'package:crud/models/form_action.dart';
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
              child: GestureDetector(
                onTap: () {
                  userProvider.formAction.selectedUserId =
                      users[indexBuilder].id;
                  Navigator.pushNamed(context, '/user_info');
                },
                child: ListTile(
                  title: Text(users[indexBuilder].name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            userProvider.formAction = FormAction(
                                selectedUserId: users[indexBuilder].id,
                                actionName: 'edit');
                            Navigator.pushNamed(context, '/edit');
                          },
                          icon: const Icon(Icons.edit))
                    ],
                  ),
                ),
              ),
            ));
  }
}
