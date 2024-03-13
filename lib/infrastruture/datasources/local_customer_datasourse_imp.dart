import 'package:colch_stat_app/domain/datasources/customer_datasource.dart';
import 'package:colch_stat_app/domain/entities/customer.dart';
import 'package:colch_stat_app/infrastruture/errors/custom_error.dart';
import 'package:colch_stat_app/infrastruture/models/customer_model.dart';
import 'package:colch_stat_app/presentation/providers/profile_provider.dart';
import 'package:colch_stat_app/shared/data/local_clientes.dart';

class LocalCustomerDataSourceImpl implements CustomerDataSource {
  @override
  Future<List<Customer>> getCustomers() async {
    // Simulando una consulta a una base de datos local o almacenamiento local
    await Future.delayed(const Duration(milliseconds: 500));

    // Crear una instancia de CustomerModel
    if (profileProviderSingleton.profileProvider.profile.token !=
        "") {
      // Llamar al método usando el metodo estatico
      List<Customer> customers =
          CustomerModel.convertClientesToCustomerList(clientes);

      return customers;
    } else {
      // Si las credenciales no coinciden, lanzamos una excepción con un mensaje de error
      throw CustomError("Token no valido, por favor inicia sesión");
    }
  }

  @override
  Future<void> createCustomer(name,  lastName,  phone,  email,  address,  identification,  typeIdentification) {
    
    // TODO: implement createCustomer
    throw UnimplementedError();
  }

  @override
  Future<void> editCustomer(name, lastName, phone, email, address) {
    // TODO: implement editCustomer
    throw UnimplementedError();
  }

  @override
  Future<void> editStateCustomer(id, state) {
    // TODO: implement editStateCustomer
    throw UnimplementedError();
  }

  @override
  void setCustomer(id) {
    // TODO: implement setCustomer
  }
}
