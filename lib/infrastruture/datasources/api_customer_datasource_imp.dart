import 'package:colch_stat_app/config/constants/enviroment.dart';
import 'package:colch_stat_app/domain/datasources/customer_datasource.dart';
import 'package:colch_stat_app/domain/entities/customer.dart';
import 'package:colch_stat_app/infrastruture/errors/custom_error.dart';
import 'package:colch_stat_app/infrastruture/models/customer_model.dart';
import 'package:dio/dio.dart';

class ApiCustomerDataSourceImpl implements CustomerDataSource {

  final _dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

@override
Future<void> createCustomer(name, lastName, phone, email, address, identification, typeIdentification) async {
  try {
    final data = CustomerModel.toJson(name, lastName, phone, email, address, identification, typeIdentification);

    print(data);
    
    await _dio.post("/clientes", data: data);

    
    


  } catch (e) {
    print("Error creating customer: $e");
    // Manejar el error de alguna manera, por ejemplo, lanzando una excepción personalizada o retornando null
    throw CustomError("Error creating customer");
  }
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