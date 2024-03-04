import 'package:colch_stat_app/domain/datasources/customer_datasource.dart';

class LocalCustomerDataSourceImpl implements CustomerDataSource {
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
  Future<void> getCustomers() {
    // TODO: implement getCustomers
    throw UnimplementedError();
  }

  @override
  void setCustomer(id) {
    // TODO: implement setCustomer
  }

}