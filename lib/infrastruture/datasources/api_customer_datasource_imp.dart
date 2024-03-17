import 'package:colch_stat_app/config/constants/enviroment.dart';
import 'package:colch_stat_app/domain/datasources/customer_datasource.dart';
import 'package:colch_stat_app/domain/entities/customer.dart';
import 'package:colch_stat_app/infrastruture/errors/custom_error.dart';
import 'package:colch_stat_app/infrastruture/models/customer_model.dart';
import 'package:colch_stat_app/presentation/providers/profile_provider.dart';
import 'package:dio/dio.dart';

class ApiCustomerDataSourceImpl implements CustomerDataSource {
  // late final Dio _dio;

  @override
  Future<void> createCustomer(name, lastName, phone, email, address,
      identification, typeIdentification) async {
    late final Dio _dio = Dio(BaseOptions(baseUrl: Environment.apiUrl, headers: {
      'authorization':
          'Bearer ${profileProviderSingleton.profileProvider.profile.token}',
    }));

    try {
      final data = CustomerModel.toJson(name, lastName, phone, email, address,
          identification, typeIdentification);

      print(data);

      await _dio.post("/clientes", data: data);

      this.getCustomers();
    } on DioError catch (e) {
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

      throw CustomError(
          "No se pudo crear el cliente, Intenta de nuevo");
    } catch (e) {
      throw CustomError(
           "No se pudo crear el cliente, Intenta de nuevo");
    }
  }

  @override
  Future<void> editCustomer(Customer customer) async {
    late final Dio _dio = Dio(BaseOptions(baseUrl: Environment.apiUrl, headers: {
      'authorization':
          'Bearer ${profileProviderSingleton.profileProvider.profile.token}',
    }));

    try {
      final data = CustomerModel.toJson(
          customer.name,
          customer.lastName,
          customer.phone,
          customer.email,
          customer.address,
          customer.identification,
          customer.typeidentification);

      await _dio.patch("/clientes/${customer.id}", data: data);
    } on DioError catch (e) {
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

      throw CustomError("No se pudo editar el cliente, Intenta de nuevo");
    } catch (e) {
      throw CustomError("No se pudo editar el cliente, Intenta de nuevo");
    }
  }

  @override
  Future<void> editStateCustomer(bool state, int id) async {

    late final Dio _dio =
        Dio(BaseOptions(baseUrl: Environment.apiUrl, headers: {
      'authorization':
          'Bearer ${profileProviderSingleton.profileProvider.profile.token}',
    }));
    try {
      final data = CustomerModel.toJsonState(state);
      await _dio.patch("/clientes/estado/${id}", data: data);
    } on DioError catch (e) {
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

    print(e);
      throw CustomError("No se pudo cambiar el estado del cliente, Intenta de nuevo");
    } catch (e) {
      print(e);
       throw CustomError(
          "No se pudo cambiar el estado del cliente, Intenta de nuevo");
    }
  }

  @override
  void setCustomer(id) {
    // TODO: implement setCustomer
  }

  @override
  Future<List<Customer>> getCustomers() async {
    late final Dio _dio =
        Dio(BaseOptions(baseUrl: Environment.apiUrl, headers: {
      'authorization':
          'Bearer ${profileProviderSingleton.profileProvider.profile.token}',
    }));


    try {
      final res = await _dio.get('/clientes');
      final data = res.data as List<dynamic>;
      final cliente = CustomerModel.convertClientesToCustomerList(
          data.cast<Map<String, dynamic>>());

      return cliente;
    } on DioError catch (e) {
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

      throw CustomError("No se pudo obtener el listado de clientes, Intenta de nuevo");
    } catch (e) {
       throw CustomError(
          "No se pudo obtener el listado de clientes, Intenta de nuevo");
    }
  }
}
