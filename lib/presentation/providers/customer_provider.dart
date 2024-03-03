import 'dart:convert';

import 'package:colch_stat_app/domain/entities/customer.dart';
import 'package:colch_stat_app/config/helpers/config.dart';
import 'package:colch_stat_app/infrastruture/models/customer_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class CustomerProvider extends ChangeNotifier {
  final _dio = Dio(BaseOptions());

  List<Customer> customerList =
      []; //* esto es una lista de entidades de usuarios

  Map<dynamic, dynamic> customer = {
    "id": "",
    "name": "",
    "lastName": "",
    "phone": "",
    "email": "",
    "address": "",
    "state": "",
  };

  int totalClients = 0;

  Map<String, dynamic> errores = {"messageEmail": "", "messagePassword": ""};

  Future<void> getCustomers() async {
    final response = await _dio.get(
        "${APIConfig.apiUrl}/clientes");

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final List<Customer> newCustomer = data
          .map((customer) => CustomerModel.fromJson(customer).toProfileEntity())
          .toList();

      customerList
          .clear(); // Limpia la lista existente antes de agregar los nuevos perfiles.
      customerList.addAll(newCustomer);

      totalClients = customerList.length;

      notifyListeners();
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
        '${APIConfig.apiUrl}/clientes',
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
        '${APIConfig.apiUrl}/clientes/$_id',
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

   

    notifyListeners();
  }

   Future<void> editStateProvider(id, state) async {
    final data = {
      'estado': state,
    };

    final jsonData = jsonEncode(data);

    try {
      final response = await _dio.patch(
        '${APIConfig.apiUrl}/clientes/estado/$id',
        data: jsonData,
      );

      if (response.statusCode == 201) {
        print('Estado modificado exitosamente');
        print('Respuesta: ${response.data}');
        // Puedes realizar alguna acción adicional si es necesario
      } else {
        print('Error al cambiar el estado');
        print('Código de estado: ${response.statusCode}');
        print('Mensaje de error: ${response.statusMessage}');
      }
    } catch (error) {
      print('Error al cambiar el estado del cliente: $error');
    }

    notifyListeners();
  }
}
