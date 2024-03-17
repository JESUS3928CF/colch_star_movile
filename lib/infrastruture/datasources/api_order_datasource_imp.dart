import 'package:dio/dio.dart';
import 'package:colch_stat_app/config/constants/enviroment.dart';
import 'package:colch_stat_app/domain/datasources/order_datasource.dart';
import 'package:colch_stat_app/domain/entities/order.dart';
import 'package:colch_stat_app/infrastruture/models/sale_model.dart';

class ApiOrderDataSourceImpl implements OrderDataSource {
  //* Para hacer las peticiones
  final Dio _dio;

  ApiOrderDataSourceImpl() : _dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  @override
  Future<List<Order>> getOrders() async {
    try {
      // Configura el interceptor para agregar el encabezado de autorización
      
      
      final response = await _dio.get('/ordenes');
      
      final data = response.data as List<dynamic>;

      final orden = OrderModel.convertOrdenesToOrdersList(data.cast<Map<String, dynamic>>());

      return orden;

    } catch (e) {
      // Capturar y relanzar la excepción
      print(e);
      rethrow;
    }
  }
}
