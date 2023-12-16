import 'package:crud/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends InheritedWidget {
  @override
  final Widget child;
  final List<User> users = [];

  UserProvider({
    super.key,
    required this.child,
  }) : super(child: child);

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  @override
  bool updateShouldNotify(UserProvider widget) {
    return true;
  }
}
