import 'package:colch_stat_app/domain/entities/order.dart';

abstract class OrderDataSource {
  Future<List<Order>> getOrders();
}