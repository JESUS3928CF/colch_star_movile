// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/sales.dart';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

class SaleModel {
    final int idVenta;
    final String producto;
    final int cantidadProducto;
    final String montoTotal;
    final String fechaEntrega;
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
        cantidadProducto: json["cantidadproducto"],
        montoTotal: json["montototal"],
        fechaEntrega: json["fechaEntrega"] ,
        descripcion: json["descripcion"],
        estado: json["estado"],
        fkCliente: json["fkcliente"],
    );
     Sales toProfileEntity () => Sales(id: idVenta, product: producto, amountproduct: cantidadProducto, totalamount: montoTotal, time: fechaEntrega, description: descripcion, state: estado,fk_cliente: fkCliente );
    


    Map<String, dynamic> toJson() => {
        "id_venta": idVenta,
        "producto": producto,
        "cantidadproducto": cantidadProducto,
        "montototal": montoTotal,
        "fechaEntrega": fechaEntrega,
        "descripcion": descripcion,
        "estado": estado,
        "fkcliente": fkCliente,
    };
}