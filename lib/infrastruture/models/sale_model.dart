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
  final List<OrderDetailModel> details;

  OrderModel(
      {required this.id,
      required this.totalPrice,
      required this.address,
      required this.creationDate,
      required this.deliverDate,
      required this.orderStatus,
      required this.clientName,
      required this.details});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id_orden"],
        totalPrice: json["precio_total"].toDouble(),
        address: json["cliente"]["direccion"],
        creationDate: DateTime.parse(json["fecha_creacion"]),
        deliverDate: DateTime.parse(json["fecha_entrega"]),
        orderStatus: json["estado_de_orden"],
        clientName:
            json["cliente"]["nombre"] + " " + json["cliente"]["apellido"],
        details: List<OrderDetailModel>.from(json["detalles"].map(
          (detailJson) => OrderDetailModel.fromJson(detailJson),
        )),
      );

  Order toOrderEntity() => Order(
        id: id,
        totalPrice: totalPrice,
        address: address,
        creationDate: creationDate,
        deliverDate: deliverDate,
        orderStatus: orderStatus,
        clientName: clientName,
        details: details.map((detail) => detail.toOrderDetailEntity()).toList(),
      );

  // Para estructurar toda una lista de datos a la forma de la entidad
  static List<Order> convertOrdenesToOrdersList(
      List<Map<String, dynamic>> clientes) {
    List<Order> customerList = clientes
        .map((cliente) => OrderModel.fromJson(cliente).toOrderEntity())
        .toList();
    return customerList;
  }
}

class OrderDetailModel {
  final int quantity;
  final String description;
  final String size;
  final String color;
  final String productName;
  final String subtotal;

  OrderDetailModel({
    required this.quantity,
    required this.description,
    required this.size,
    required this.color,
    required this.productName,
    required this.subtotal,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailModel(
      quantity: json["cantidad"],
      description: json["descripcion"],
      size: json["talla"],
      color: json["color"],
      productName: json["producto"]["nombre"],
      subtotal: json["subtotal"],
    );
  }

  OrderDetailModel toOrderDetailEntity() => OrderDetailModel(
        quantity: quantity,
        description: description,
        size: size,
        color: color,
        productName: productName,
        subtotal: subtotal,
      );
}
