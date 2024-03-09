import 'package:colch_stat_app/domain/entities/customer.dart';

abstract class CustomerDataSource {

  Future<List<Customer>> getCustomers();

  Future<void> createCustomer(name, lastName, phone, email, address);

  void setCustomer(id);

  Future<void> editCustomer(name, lastName, phone, email, address);

  Future<void> editStateCustomer(id, state);
}