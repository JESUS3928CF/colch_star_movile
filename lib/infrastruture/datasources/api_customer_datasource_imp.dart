import 'package:colch_stat_app/config/constants/enviroment.dart';
import 'package:colch_stat_app/domain/datasources/customer_datasource.dart';
import 'package:colch_stat_app/domain/entities/customer.dart';
import 'package:colch_stat_app/infrastruture/errors/custom_error.dart';
import 'package:colch_stat_app/infrastruture/models/customer_model.dart';
import 'package:colch_stat_app/presentation/providers/profile_provider.dart';
import 'package:dio/dio.dart';

class ApiCustomerDataSourceImpl implements CustomerDataSource {

  late final Dio _dio;

@override
Future<void> createCustomer(name, lastName, phone, email, address, identification, typeIdentification) async {
  _dio = Dio(BaseOptions(baseUrl: Environment.apiUrl, headers: {
      'authorization':
          'Bearer ${profileProviderSingleton.profileProvider.profile.token}',
    }));

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
  Future<void> editCustomer( Customer customer) async {

    _dio = Dio(BaseOptions(baseUrl: Environment.apiUrl, headers: {
      'authorization':
          'Bearer ${profileProviderSingleton.profileProvider.profile.token}',
    }));



    try{

      final data = CustomerModel.toJson(customer.name, customer.lastName, customer.phone, customer.email,customer.address, customer.identification , customer.typeidentification);

      await _dio.patch("/clientes/${customer.id}", data: data);




    }on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 403) {
          final responseData = e.response!.data;
          if (responseData != null && responseData.containsKey("message")) {
            final errorMessage = responseData["message"];
            throw CustomError(errorMessage);
          }
        }
      }

      if (e.type == DioErrorType.connectionTimeout) {
        throw ConnectionTimeout();
      }

      print(e.response!.statusCode);
      print(e);

      throw CustomError("Algo malo paso nivel 1");
    } catch (e) {
      throw CustomError("Algo malo paso nivel 2");
    }
  }
  

  @override
  Future<void> editStateCustomer(Customer customer) async {

    _dio = Dio(BaseOptions(baseUrl: Environment.apiUrl, headers: {
      'authorization':
          'Bearer ${profileProviderSingleton.profileProvider.profile.token}',
    }));


try{

  final data = CustomerModel.toJsonState(customer.state);
  await _dio.patch("/clientes/estado/${customer.id}", data: data);
  

  }on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 403) {
          final responseData = e.response!.data;
          if (responseData != null && responseData.containsKey("message")) {
            final errorMessage = responseData["message"];
            throw CustomError(errorMessage);
          }
        }
      }

      if (e.type == DioErrorType.connectionTimeout) {
        throw ConnectionTimeout();
      }

      print(e.response!.statusCode);
      print(e);

      throw CustomError("Algo malo paso nivel 1");
    } catch (e) {
      throw CustomError("Algo malo paso nivel 2");
    }
  }

  @override
  void setCustomer(id) {
    // TODO: implement setCustomer
  }

  @override
  Future<List<Customer>> getCustomers() async {

    _dio = Dio(BaseOptions(baseUrl: Environment.apiUrl, headers: {
      'authorization':
          'Bearer ${profileProviderSingleton.profileProvider.profile.token}',
    }));


    try{

      final res = await _dio.get('/clientes');
      final data = res.data as List<dynamic>;
      final cliente = CustomerModel.convertClientesToCustomerList(data.cast<Map<String, dynamic>>());

      return cliente;

    }catch(e){

      print("Error creating customer: $e");
    // Manejar el error de alguna manera, por ejemplo, lanzando una excepción personalizada o retornando null
    throw CustomError("Error creating customer");

    }
   
  }
}