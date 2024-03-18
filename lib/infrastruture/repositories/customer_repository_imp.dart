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
  
  // No es urgente implementar esto aun
 @override
Future<void> createCustomer( name,  lastName,  phone,  email,  address,  identification,  typeIdentification) {
  return customerDataSource.createCustomer(name, lastName, phone, email, address, identification, typeIdentification);
}


  @override
  Future<void> editCustomer(Customer customer) {

    return customerDataSource.editCustomer(customer);
  }

  @override
  Future<void> editStateCustomer(bool state, int id) {

    return customerDataSource.editStateCustomer(state, id);
  }
  @override
  void setCustomer(id) {
    // TODO: implement setCustomer
  }
  
  

 

}
