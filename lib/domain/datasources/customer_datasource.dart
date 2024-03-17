import 'package:colch_stat_app/domain/entities/customer.dart';

abstract class CustomerDataSource {

  Future<List<Customer>> getCustomers();

  Future<void> createCustomer( String name, String lastName, String phone, String email, String address,  String identification, String typeIdentification);

  void setCustomer(id);

  Future<void> editCustomer(Customer customer);

  Future<void> editStateCustomer(Customer customer); 
}