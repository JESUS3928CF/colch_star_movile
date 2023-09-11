import 'package:colch_stat_app/presentation/providers/profile_provider.dart';
import 'package:colch_stat_app/presentation/screens/login_creen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //! Usando el provider para poder acceder a la información que tenemos hay
  @override

  /// 1 envolvemos el provider en el árbol principal para hacer disponible la info en toda nuestra app
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                ProfileProvider()) //* Aca ponen sus provider el de cliente y el de proveedor
      ],
      child: const MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: LoginScreen(
          title: 'Hola',
        ),
      ),
    );
  }
}
