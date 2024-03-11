// To parse this JSON data, do
//
//     final saleModel = saleModelFromJson(jsonString);

import '../../domain/entities/order.dart';

// SaleModel saleModelFromJson(String str) => SaleModel.fromJson(json.decode(str));

// String saleModelToJson(SaleModel data) => json.encode(data.toJson());

class OrderModel {
  final int id;
  final double totalPrice;
  final String address;
  final DateTime creationDate;
  final DateTime deliverDate;
  final String orderStatus;
  final String clientName;

  OrderModel({
    required this.id,
      required this.totalPrice,
      required this.address,
      required this.creationDate,
      required this.deliverDate,
      required this.orderStatus,
      required this.clientName
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id_orden"],
        totalPrice: json["precio_total"].toDouble(),
        address: json["cliente"]["direccion"],
        creationDate: DateTime.parse(json["fecha_creacion"]),
        deliverDate: DateTime.parse(json["fecha_entrega"]),
        orderStatus: json["estado_de_orden"],
        clientName: json["cliente"]["nombre"] + " " + json["cliente"]["apellido"]
      );

  Order toOrderEntity() => Order(
      id: id,
      totalPrice: totalPrice,
      address: address,
      creationDate: creationDate,
      deliverDate: deliverDate,
      orderStatus: orderStatus,
      clientName: clientName,);



  // Para estructurar toda una lista de datos a la forma de la entidad
  static List<Order> convertOrdenesToOrdersList(
      List<Map<String, dynamic>> clientes) {
    List<Order> customerList = clientes
        .map((cliente) => OrderModel.fromJson(cliente).toOrderEntity())
        .toList();
    return customerList;
  }
}
