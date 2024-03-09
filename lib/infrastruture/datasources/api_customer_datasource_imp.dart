import 'package:colch_stat_app/domain/datasources/customer_datasource.dart';
import 'package:colch_stat_app/domain/entities/customer.dart';
import 'package:dio/dio.dart';

class ApiCustomerDataSourceImpl implements CustomerDataSource {

  final _dio = Dio(BaseOptions());

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

  @override
  Future<List<Customer>> getCustomers() {
    // TODO: implement getCustomers
    throw UnimplementedError();
  }
  
}