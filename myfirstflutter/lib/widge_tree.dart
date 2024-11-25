import 'package:myfirstflutter/auth.dart';
import 'package:myfirstflutter/pages/home.dart';
import 'package:myfirstflutter/pages/login_register.dart';
import 'package:flutter/material.dart';

class WidgeTree extends StatefulWidget {
  const WidgeTree({super.key});

  @override
  State<WidgeTree> createState() => _WidgeTreeState();
}

class _WidgeTreeState extends State<WidgeTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, userState) {
          return userState.hasData ? HomePage() : const LoginPage();
        });
  }
}
