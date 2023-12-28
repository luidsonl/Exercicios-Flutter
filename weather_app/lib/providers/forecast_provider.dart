import 'package:flutter/material.dart';

class UserProvider extends InheritedWidget {
  @override
  final Widget child;

  const UserProvider({
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
