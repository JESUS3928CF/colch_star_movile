import 'package:colch_stat_app/domain/repositories/profile_repository.dart';
import 'package:colch_stat_app/infrastruture/datasources/local_customer_datasourse_imp.dart';
import 'package:colch_stat_app/infrastruture/datasources/local_profile_datasource_imp.dart';
import 'package:colch_stat_app/infrastruture/repositories/customer_repository_imp.dart';
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
    final profileRepository = ProfileRepositoryImpl(profileDataSource: LocalProfileDataSourceImpl());
    final customerRepository = CustomerRepositoryImpl(customerDataSource: LocalCustomerDataSourceImpl());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProfileProvider( profileRepository: profileRepository),
        ),
        ChangeNotifierProvider(create: (_) => CustomerProvider( customerRepository: customerRepository)),
        ChangeNotifierProvider(
            create: (_) =>
                SaleProvider()) //* Aca ponen sus provider el de cliente y el de proveedor
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
