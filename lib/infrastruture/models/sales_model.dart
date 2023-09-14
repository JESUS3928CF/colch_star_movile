// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



import 'package:colch_stat_app/domain/entities/sales.dart';

//  SalesModel welcomeFromJson(String str) => SalesModel.fromJson(json.decode(str));

// String welcomeToJson(SalesModel data) => json.encode(data.toJson());

class SalesModel {
    final int idVenta;
    final String producto;
    final int cantidadProducto;
    final double montoTotal;
    final DateTime fechaEntrega;
    final String descripcion;
    final bool estado;
    final int fkCliente;

    SalesModel({
        required this.idVenta,
        required this.producto,
        required this.cantidadProducto,
        required this.montoTotal,
        required this.fechaEntrega,
        required this.descripcion,
        required this.estado,
        required this.fkCliente,
    });

    factory SalesModel.fromJson(Map<String, dynamic> json) => SalesModel(
        idVenta: json["id_venta"],
        producto: json["producto"],
        cantidadProducto: json["cantidad_producto"],
        montoTotal: json["monto_total"],
        fechaEntrega: DateTime.parse(json["fecha_entrega"]),
        descripcion: json["descripcion"],
        estado: json["estado"],
        fkCliente: json["fk_cliente"],
    );


        Sales toProfileEntity () => Sales(id: idVenta, products:producto, amountProducts: cantidadProducto, price: montoTotal,deliverDate: fechaEntrega, description: descripcion, state: estado);


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