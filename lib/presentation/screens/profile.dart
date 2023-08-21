// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          /// Así aliemos este row al final
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
            Padding(
              /// de esta forma damos padding horizontal a un widget
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("Colch Star"),
            )
          ],
        ),
      ),
      body: const Center(
        child: Text('This is MySecondPage'),
      ),
    );
  }
}
