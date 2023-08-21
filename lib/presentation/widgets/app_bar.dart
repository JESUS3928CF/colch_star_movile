import 'package:flutter/material.dart';

class AppBarColch extends StatelessWidget {
  const AppBarColch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Colch Star"),
          ),
        ],
      ),
    );
  }
}
