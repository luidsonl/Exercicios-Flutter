import 'package:crud/models/form_action.dart';
import 'package:crud/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends InheritedWidget {
  @override
  final Widget child;
  List<User> users = [];
  FormAction formAction = FormAction(selectedUserId: -1, actionName: 'create');

  UserProvider({
    super.key,
    required this.child,
  }) : super(child: child);

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return true;
  }
}
