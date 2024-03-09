import 'package:colch_stat_app/domain/datasources/order_datasource.dart';
import 'package:colch_stat_app/domain/entities/order.dart';
import 'package:colch_stat_app/infrastruture/models/sale_model.dart';
import 'package:colch_stat_app/shared/data/local_ordenes.dart';

class LocalOrderDataSourceImpl implements OrderDataSource {
  @override
  Future<List<Order>> getOrders() async {

    await Future.delayed(const Duration(seconds: 1));

    // Llamar al método usando el metodo estatico 
    List<Order> orders =  OrderModel.convertOrdenesToOrdersList(ordenes);

    return orders;
  }

}