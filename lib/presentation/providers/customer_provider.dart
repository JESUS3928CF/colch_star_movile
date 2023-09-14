import 'dart:convert';

import 'package:colch_stat_app/domain/entities/customer.dart';
import 'package:colch_stat_app/infrastruture/models/customer_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class CustomerProvider extends ChangeNotifier {
  final _dio = Dio(BaseOptions());

  /// Si vas a manejar varios elementos de el mismo tipo aca harías un atributo de tipo array
  List<Customer> customerList =
      []; //* esto es una lista de entidades de usuarios

  /// Propiedad a llenar si alguien se loguea
  Map<dynamic, dynamic> customer = {
    "id": "",
    "name": "",
    "lastName": "",
    "phone": "",
    "email": "",
    "address": "",
    "state": "",
  };

  /// Propiedad a llenar alguien intenta loguearse pero comete errores
  Map<String, dynamic> errores = {"messageEmail": "", "messagePassword": ""};

  //! Esta petición no se una para el perfil pero es un ejemplo de como traer varios registros
  Future<void> getCustomers() async {
    final response = await _dio.get(
        "https://backend-colch-star-production.up.railway.app/api/clientes");

    print("Cnsultando clientes");
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final List<Customer> newCustomer = data
          .map((customer) => CustomerModel.fromJson(customer).toProfileEntity())
          .toList();

      customerList
          .clear(); // Limpia la lista existente antes de agregar los nuevos perfiles.
      customerList.addAll(newCustomer);

      notifyListeners();
      print("Cnsultando clientes");
      print(customerList[0].name);
    } else {
      // Manejar el error aquí si es necesario
    }
  }

  Future<void> createCustomer(name, lastName, phone, email, address) async {
    final data = {
      'nombre': name,
      'apellido': lastName,
      'telefono': phone,
      'email': email,
      'direccion': address,
    };

    final jsonData = jsonEncode(data);

    try {
      final response = await _dio.post(
        'https://backend-colch-star-production.up.railway.app/api/clientes',
        data: jsonData,
      );

      if (response.statusCode == 201) {
        print('Cliente creado exitosamente');
        print('Respuesta: ${response.data}');
        // Puedes realizar alguna acción adicional si es necesario
      } else {
        print('Error al crear el cliente');
        print('Código de estado: ${response.statusCode}');
        print('Mensaje de error: ${response.statusMessage}');
      }
    } catch (error) {
      print('Error al crear el cliente: $error');
    }
  }

  void setCustomer(id) async {
    customerList[id - 1];

    customer = {
      "id": customerList[id - 1].id,
      "name": customerList[id - 1].name,
      "lastName": customerList[id - 1].lastName,
      "phone": customerList[id - 1].phone,
      "email": customerList[id - 1].email,
      "address": customerList[id - 1].address,
      "state": customerList[id - 1].state,
    };

    print(customer);

    notifyListeners();
  }

  Future<void> editCustomer(name, lastName, phone, email, address) async {
    final data = {
      'nombre': name,
      'apellido': lastName,
      'telefono': phone,
      'email': email,
      'direccion': address,
    };

    final jsonData = jsonEncode(data);

    var _id = customer["id"];
    try {
      final response = await _dio.patch(
        'https://backend-colch-star-production.up.railway.app/api/clientes/$_id',
        data: jsonData,
      );

      if (response.statusCode == 201) {
        print('Cliente creado exitosamente');
        print('Respuesta: ${response.data}');
        // Puedes realizar alguna acción adicional si es necesario
      } else {
        print('Error al crear el cliente');
        print('Código de estado: ${response.statusCode}');
        print('Mensaje de error: ${response.statusMessage}');
      }
    } catch (error) {
      print('Error al edita el cliente: $error');
    }
  }

  notifyListeners();
}
