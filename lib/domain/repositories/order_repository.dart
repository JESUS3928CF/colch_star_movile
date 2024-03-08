import 'package:colch_stat_app/domain/entities/order.dart';

abstract class OrderRepository {  
  Future<List<Order>> getOrders();
}