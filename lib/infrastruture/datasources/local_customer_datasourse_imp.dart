import 'package:colch_stat_app/domain/datasources/customer_datasource.dart';
import 'package:colch_stat_app/domain/entities/customer.dart';
import 'package:colch_stat_app/infrastruture/models/customer_model.dart';
import 'package:colch_stat_app/shared/data/local_clientes.dart';

class LocalCustomerDataSourceImpl implements CustomerDataSource {
  
  @override
  Future<List<Customer>> getCustomers() async {

    // Simulando una consulta a una base de datos local o almacenamiento local
    await Future.delayed(const Duration(seconds: 2));

    // Crear una instancia de CustomerModel

    // Llamar al método usando el metodo estatico 
    List<Customer> customers =  CustomerModel.convertClientesToCustomerList(clientes);

    return customers;
  }
  @override
  Future<void> createCustomer(name, lastName, phone, email, address) {
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