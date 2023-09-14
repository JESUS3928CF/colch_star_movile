// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

import 'package:colch_stat_app/domain/entities/customer.dart';

// CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));

// String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
    final int idCliente;
    final String nombre;
    final String apellido;
    final String telefono;
    final String email;
    final String direccion;
    final bool estado;

    CustomerModel({
        required this.idCliente,
        required this.nombre,
        required this.apellido,
        required this.telefono,
        required this.email,
        required this.direccion,
        required this.estado,
    });

    factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        idCliente: json["id_cliente"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        telefono: json["telefono"],
        email: json["email"],
        direccion: json["direccion"],
        estado: json["estado"],
    );

     /// Crear un método para retornar ese usuario usamos la entidad
    Customer toProfileEntity () => Customer(id: idCliente, name: nombre, lastName: apellido, phone: telefono, email: email, address: direccion, state: estado );
    

    Map<String, dynamic> toJson() => {
        "id_cliente": idCliente,
        "nombre": nombre,
        "apellido": apellido,
        "telefono": telefono,
        "email": email,
        "direccion": direccion,
        "estado": estado,
    };
}
