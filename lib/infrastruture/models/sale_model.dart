// To parse this JSON data, do
//
//     final saleModel = saleModelFromJson(jsonString);

import '../../domain/entities/order.dart';

// SaleModel saleModelFromJson(String str) => SaleModel.fromJson(json.decode(str));

// String saleModelToJson(SaleModel data) => json.encode(data.toJson());

class OrderModel {
  final int id;
  final String product;
  final int amountProduct;
  final int total;
  final DateTime time;
  final String description;
  final bool state;
  final int fkSale;

  OrderModel({
    required this.id,
    required this.product,
    required this.amountProduct,
    required this.total,
    required this.time,
    required this.description,
    required this.state,
    required this.fkSale,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id_venta"],
        product: json["producto"],
        amountProduct: json["cantidad_producto"],
        total: json["monto_total"],
        time: DateTime.parse(json["fecha_entrega"]),
        description: json["descripcion"],
        state: json["estado"],
        fkSale: json["fk_cliente"],
      );

  Order toOrderEntity() => Order(
      id: id,
      product: product,
      amountProduct: amountProduct,
      total: total,
      time: time,
      description: description,
      state: state,
      fkSale: fkSale);

  Map<String, dynamic> toJson() => {
        "id_venta": id,
        "producto": product,
        "cantidad_producto": amountProduct,
        "monto_total": total,
        "fecha_entrega":
            "${time.year.toString().padLeft(4, '0')}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}",
        "descripcion": description,
        "estado": state,
        "fk_cliente": fkSale,
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
