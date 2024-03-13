// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'package:colch_stat_app/domain/entities/customer.dart';

// CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));

// String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  final int id;
  final String name;
  final String lastName;
  final String phone;
  final String email;
  final String address;
  final String identification;
  final String typeidentification;
  final bool state;

  CustomerModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.address,
    required this.identification,
    required this.typeidentification,
    required this.state,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id_cliente"],
        name: json["nombre"],
        lastName: json["apellido"],
        phone: json["telefono"],
        email: json["email"],
        address: json["direccion"],
        identification:json["identificacion"] ,
        typeidentification:json["tipoIdentificacion"] ,
        state: json["estado"],
      );

  /// Crear un método para retornar ese usuario usamos la entidad
  Customer toCustomerEntity() => Customer(
      id: id,
      name: name,
      lastName: lastName,
      phone: phone,
      email: email,
      address: address,
      identification: identification,
      typeidentification: typeidentification,
      state: state);

  static Map<String, dynamic> toJson(String name, String lastName , String phone, String email, String address, String identification, String typeidentification ) => {
        "nombre": name,
        "apellido": lastName,
        "telefono": phone,
        "email": email,
        "direccion": address,
        "identificacion": identification,
        "tipoIdentificacion": typeidentification,
      };

  // Para estructurar toda una lista de datos a la forma de la entidad

  static List<Customer> convertClientesToCustomerList(
      List<Map<String, dynamic>> clientes) {
    List<Customer> customerList = clientes
        .map((cliente) => CustomerModel.fromJson(cliente).toCustomerEntity())
        .toList();
    return customerList;
  }
}
