import 'package:colch_stat_app/infrastruture/errors/custom_error.dart';
import 'package:colch_stat_app/presentation/providers/profile_provider.dart';
import 'package:dio/dio.dart';
import 'package:colch_stat_app/config/constants/enviroment.dart';
import 'package:colch_stat_app/domain/datasources/order_datasource.dart';
import 'package:colch_stat_app/domain/entities/order.dart';
import 'package:colch_stat_app/infrastruture/models/sale_model.dart';

class ApiOrderDataSourceImpl implements OrderDataSource {


  // ApiOrderDataSourceImpl() : _dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  @override
  Future<List<Order>> getOrders() async {

    late final Dio _dio =
        Dio(BaseOptions(baseUrl: Environment.apiUrl, headers: {
      'authorization':
          'Bearer ${profileProviderSingleton.profileProvider.profile.token}',
    }));

    
    try {
      // Configura el interceptor para agregar el encabezado de autorización
      
      
      final response = await _dio.get('/ordenes');
      
      final data = response.data as List<dynamic>;

      final orden = OrderModel.convertOrdenesToOrdersList(data.cast<Map<String, dynamic>>());

      return orden;

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

      throw CustomError("Algo malo paso nivel 1");
    } catch (e) {
      print(e);
      throw CustomError("Algo malo paso nivel 2");
    }
  }
}
