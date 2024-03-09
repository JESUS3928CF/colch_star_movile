import 'package:colch_stat_app/domain/datasources/customer_datasource.dart';
import 'package:colch_stat_app/domain/entities/customer.dart';
import 'package:colch_stat_app/domain/repositories/customer_repository.dart';

class CustomerRepositoryImpl extends CustomerRepository {
  
  //- llamar el data source que usaremos
  final CustomerDataSource customerDataSource;

  CustomerRepositoryImpl({required this.customerDataSource});
  
  @override
  Future<List<Customer>> getCustomers() {
    return customerDataSource.getCustomers();
  }
  
  /// No es urgente implementar esto aun
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