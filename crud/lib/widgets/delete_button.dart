import 'package:crud/providers/user_provider.dart';
import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    void delete() {
      UserProvider userProvider = UserProvider.of(context) as UserProvider;
      int? selectedUserId = userProvider.formAction.selectedUserId;

      userProvider.users.removeWhere((element) => element.id == selectedUserId);
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: delete, icon: const Icon(Icons.delete)),
      ],
    );
  }
}
