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
    final bool state;

    CustomerModel({
        required this.id,
        required this.name,
        required this.lastName,
        required this.phone,
        required this.email,
        required this.address,
        required this.state,
    });

    factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id_cliente"],
        name: json["nombre"],
        lastName: json["apellido"],
        phone: json["telefono"],
        email: json["email"],
        address: json["direccion"],
        state: json["estado"],
    );

     /// Crear un método para retornar ese usuario usamos la entidad
    Customer toProfileEntity () => Customer(id: id, name: name, lastName: lastName, phone: phone, email: email, address: address, state: state );
    

    Map<String, dynamic> toJson() => {
        "id_cliente": id,
        "nombre": name,
        "apellido": lastName,
        "telefono": pragma,
        "email": email,
        "direccion": address,
        "estado": state,
    };
}
