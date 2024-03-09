import 'package:colch_stat_app/domain/datasources/order_datasource.dart';
import 'package:colch_stat_app/domain/entities/order.dart';
import 'package:colch_stat_app/domain/repositories/order_repository.dart';

class OrdersRepositoryImpl extends OrderRepository {

  //- llamar el data source que usaremos
  final OrderDataSource orderDataSource;

  OrdersRepositoryImpl({required this.orderDataSource});


  @override
  Future<List<Order>> getOrders() {
    return orderDataSource.getOrders();
  }
}

