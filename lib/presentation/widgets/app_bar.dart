import 'package:flutter/material.dart';

class AppBarColch extends StatelessWidget {
  const AppBarColch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF14131B), // Color del menú
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Colch Star",
              style: TextStyle(
                color: Colors.white, // Color de texto blanco
              ),
            ),
          ),
        ],
      ),
    );
  }
}
