import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstflutter/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailController.text, password: _passController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _emailController.text, password: _passController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('Firebase Authentication');
  }

  Widget _inputField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage ?? '');
  }

  Widget _submitButton() {
    return ElevatedButton(
        onPressed: isLogin
            ? signInWithEmailAndPassword
            : createUserWithEmailAndPassword,
        child: Text(isLogin ? "Login" : "Sign up"));
  }

  Widget _changeLoginOrRegisterState() {
    return TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(isLogin ? 'Register an account' : 'Login instead'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _inputField('Email', _emailController),
            _inputField('Password', _passController),
            _errorMessage(),
            _submitButton(),
            _changeLoginOrRegisterState(),
          ],
        ),
      ),
    );
  }
}
