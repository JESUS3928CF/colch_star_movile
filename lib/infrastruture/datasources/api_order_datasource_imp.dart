import 'package:colch_stat_app/domain/datasources/order_datasource.dart';
import 'package:colch_stat_app/domain/entities/order.dart';
import 'package:dio/dio.dart';
import 'package:colch_stat_app/config/constants/enviroment.dart';
import 'package:colch_stat_app/infrastruture/models/sale_model.dart';



class ApiOrderDataSourceImpl implements OrderDataSource {


    //* Para hacer las peticiones
  final _dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl
  ));

  @override
  Future<List<Order>> getOrders() async {

    try {
      final response = await _dio.get('/ordenes');

      final orden = OrderModel.fromJson(response.data["ordenes"]).toOrderEntity();

   
    } catch (e) {
      // Capturar y relanzar la excepción
      throw e;

    }
    





    throw UnimplementedError();
  }

}