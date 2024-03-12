import 'package:colch_stat_app/domain/datasources/order_datasource.dart';
import 'package:colch_stat_app/domain/entities/order.dart';
import 'package:dio/dio.dart';
import 'package:colch_stat_app/config/constants/enviroment.dart';




class ApiOrderDataSourceImpl implements OrderDataSource {


    //* Para hacer las peticiones
  final _dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl
  ));
  
  @override
  Future<List<Order>> getOrders() {

    // TODO: implement getOrders
    throw UnimplementedError();
  }

}