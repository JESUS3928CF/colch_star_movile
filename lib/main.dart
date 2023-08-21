import 'package:colch_stat_app/presentation/screens/profile.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          /// se envuelve el botón con un builder para que el Navigator no de error
          child: Builder(builder: (context) {
            return FilledButton.tonal(
                onPressed: () {
                  /// 2) De esta forma renderízamos otra pagina
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile()));
                },
                child: const Text("Iniciar sección"));
          }),
        ),
      ),
    );
  }
}
