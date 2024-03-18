import 'package:colch_stat_app/config/constants/enviroment.dart';
import 'package:colch_stat_app/presentation/providers/customer_provider.dart';
import 'package:colch_stat_app/presentation/providers/profile_provider.dart';
import 'package:colch_stat_app/presentation/providers/sale_provider.dart';
import 'package:colch_stat_app/presentation/screens/login_creen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {

  // cangamos el archivo de forma asíncrona
  await Environment.initEnvironment();

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //! Usando el provider para poder acceder a la información que tenemos hay
  @override

  /// 1 envolvemos el provider en el árbol principal para hacer disponible la info en toda nuestra app
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => profileProviderSingleton.profileProvider,
        ),

        /// 1) Usar el CustomerProviderSingleton en lugar de instanciar directamente CustomerProvider
        ChangeNotifierProvider.value(
            value: customerProviderSingleton.customerProvider),
        ChangeNotifierProvider(
            create: (_) => orderProviderSingleton
                .orderProvider) //* Aca ponen sus provider el de cliente y el de proveedor
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: WillPopScope(
          onWillPop: () async {
            // Aquí puedes implementar la lógica para deshabilitar el botón de retroceso
            return false; // Devuelve false para deshabilitar el botón de retroceso
          },
          child: const LoginScreen(title: 'Hola'),
        ),
      ),
    );
  }
}
