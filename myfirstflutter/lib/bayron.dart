import 'package:flutter/material.dart';

class Bayron extends StatelessWidget {
  const Bayron({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Layouts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 190,
              width: 190,
              color: Colors.green,
            ),
            Container(
              height: 120,
              width: 120,
              color: Colors.red,
            ),
            Container(
              height: 90,
              width: 90,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
