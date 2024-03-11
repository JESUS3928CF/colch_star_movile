// To parse this JSON data, do
//
//     final saleModel = saleModelFromJson(jsonString);

import '../../domain/entities/order.dart';

// SaleModel saleModelFromJson(String str) => SaleModel.fromJson(json.decode(str));

// String saleModelToJson(SaleModel data) => json.encode(data.toJson());

class OrderModel {
  final int id;
  final double precio_total;
  final String direccion;
  final DateTime fecha_creacion;
  final DateTime fecha_entrega;
  final String estado_de_orden;
  final int fk_cliente;

  OrderModel({
    required this.id,
      required this.precio_total,
      required this.direccion,
      required this.fecha_creacion,
      required this.fecha_entrega,
      required this.estado_de_orden,
      required this.fk_cliente
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id_orden"],
        precio_total: json["precio_total"],
        direccion: json["direccion"],
        fecha_creacion: DateTime.parse(json["fecha_creacion"]),
        fecha_entrega: DateTime.parse(json["fecha_entrega"]),
        estado_de_orden: json["estado_de_orden"],
        fk_cliente: json["fk_cliente"],
      );

  Order toOrderEntity() => Order(
      id: id,
      precio_total: precio_total,
      direccion: direccion,
      fecha_creacion: fecha_creacion,
      fecha_entrega: fecha_entrega,
      estado_de_orden: estado_de_orden,
      fk_cliente: fk_cliente,);

  Map<String, dynamic> toJson() => {
        "id_venta": id,
        "precio_total": precio_total,
        "direccion": direccion,
        "fecha_creacion": fecha_creacion,
        "fecha_entrega": fecha_entrega,
        "estado_de_orden": estado_de_orden,
        "fk_cliente": fk_cliente,
      };

  // Para estructurar toda una lista de datos a la forma de la entidad
  static List<Order> convertOrdenesToOrdersList(
      List<Map<String, dynamic>> clientes) {
    List<Order> customerList = clientes
        .map((cliente) => OrderModel.fromJson(cliente).toOrderEntity())
        .toList();
    return customerList;
  }
}
