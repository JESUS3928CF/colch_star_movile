// To parse this JSON data, do
//
//     final saleModel = saleModelFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/sale.dart';

// SaleModel saleModelFromJson(String str) => SaleModel.fromJson(json.decode(str));

// String saleModelToJson(SaleModel data) => json.encode(data.toJson());

class SaleModel {
    final int idVenta;
    final String producto;
    final int cantidadProducto;
    final String montoTotal;
    final DateTime fechaEntrega;
    final String descripcion;
    final bool estado;
    final int fkCliente;

    SaleModel({
        required this.idVenta,
        required this.producto,
        required this.cantidadProducto,
        required this.montoTotal,
        required this.fechaEntrega,
        required this.descripcion,
        required this.estado,
        required this.fkCliente,
    });

    factory SaleModel.fromJson(Map<String, dynamic> json) => SaleModel(
        idVenta: json["id_venta"],
        producto: json["producto"],
        cantidadProducto: json["cantidad_producto"],
        montoTotal: json["monto_total"],
        fechaEntrega: DateTime.parse(json["fecha_entrega"]),
        descripcion: json["descripcion"],
        estado: json["estado"],
        fkCliente: json["fk_cliente"],
    );

    Sale toProfileEntity () => Sale(id: idVenta, product: producto, amountProduct: cantidadProducto, montTotal: montoTotal, time: fechaEntrega, description: descripcion, state: estado , fksale: fkCliente );
    
    Map<String, dynamic> toJson() => {
        "id_venta": idVenta,
        "producto": producto,
        "cantidad_producto": cantidadProducto,
        "monto_total": montoTotal,
        "fecha_entrega": "${fechaEntrega.year.toString().padLeft(4, '0')}-${fechaEntrega.month.toString().padLeft(2, '0')}-${fechaEntrega.day.toString().padLeft(2, '0')}",
        "descripcion": descripcion,
        "estado": estado,
        "fk_cliente": fkCliente,
    };
}
