import 'package:colch_stat_app/infrastruture/datasources/local_profile_datasource_imp.dart';
import 'package:colch_stat_app/infrastruture/repositories/profile_repository_imp.dart';
import 'package:colch_stat_app/presentation/providers/customer_provider.dart';
import 'package:colch_stat_app/presentation/providers/profile_provider.dart';
import 'package:colch_stat_app/presentation/providers/sale_provider.dart';
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
    // todo: instanciar el repository y el data source aquí de cada provider
    final profileRepository =
        ProfileRepositoryImpl(profileDataSource: LocalProfileDataSourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(profileRepository: profileRepository),
        ),

        /// 1) Usar el CustomerProviderSingleton en lugar de instanciar directamente CustomerProvider
        ChangeNotifierProvider.value(
            value: customerProviderSingleton.customerProvider),
        ChangeNotifierProvider(
            create: (_) => orderProviderSingleton
                .orderProvider) //* Aca ponen sus provider el de cliente y el de proveedor
      ],
      child: const MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: LoginScreen(title: 'Hola'),
      ),
    );
  }
}
