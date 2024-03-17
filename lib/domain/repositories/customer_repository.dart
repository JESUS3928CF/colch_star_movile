import 'package:colch_stat_app/domain/entities/customer.dart';

abstract class CustomerRepository {  

  Future<List<Customer>> getCustomers();

  Future<void> createCustomer(name, lastName, phone, email, address, identification , typeIdentification);

  void setCustomer(int id);

  Future<void> editCustomer(Customer customer);

  Future<void> editStateCustomer(Customer customer);
  
}