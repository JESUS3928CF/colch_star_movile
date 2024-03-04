import 'dart:convert';

import 'package:colch_stat_app/domain/entities/customer.dart';
import 'package:colch_stat_app/config/helpers/config.dart';
import 'package:colch_stat_app/domain/entities/profile.dart';
import 'package:colch_stat_app/infrastruture/models/customer_model.dart';
import 'package:colch_stat_app/infrastruture/repositories/customer_repository_imp.dart';
import 'package:flutter/widgets.dart';

class CustomerProvider extends ChangeNotifier {

  final CustomerRepositoryImpl customerRepository;

  List<Customer> customerList =
      []; //* esto es una lista de entidades de usuarios

  Customer _customer = Customer(id: 0, name: "", lastName: "", phone: "", email: "", address: "", state: false);

  int totalClients = 0;

  Map<String, dynamic> errores = {"messageEmail": "", "messagePassword": ""};

  CustomerProvider({required this.customerRepository});

  Future<void> getCustomers() async {

      customerList = await customerRepository.getCustomers();
    
      // customerList.addAll(newCustomer);

      totalClients = customerList.length;

      notifyListeners();
  }

  Future<void> createCustomer(name, lastName, phone, email, address) async {
    // final data = {
    //   'nombre': name,
    //   'apellido': lastName,
    //   'telefono': phone,
    //   'email': email,
    //   'direccion': address,
    // };

    // final jsonData = jsonEncode(data);

    // try {
    //   final response = await _dio.post(
    //     '${APIConfig.apiUrl}/clientes',
    //     data: jsonData,
    //   );

    //   if (response.statusCode == 201) {
    //     print('Cliente creado exitosamente');
    //     print('Respuesta: ${response.data}');
    //     // Puedes realizar alguna acción adicional si es necesario
    //   } else {
    //     print('Error al crear el cliente');
    //     print('Código de estado: ${response.statusCode}');
    //     print('Mensaje de error: ${response.statusMessage}');
    //   }
    // } catch (error) {
    //   print('Error al crear el cliente: $error');
    // }
  }

  /// Esto es para llenar el cliente que se va a editar
  void setCustomer(id) async {
    // customerList[id - 1];

    // customer = {
    //   "id": customerList[id - 1].id,
    //   "name": customerList[id - 1].name,
    //   "lastName": customerList[id - 1].lastName,
    //   "phone": customerList[id - 1].phone,
    //   "email": customerList[id - 1].email,
    //   "address": customerList[id - 1].address,
    //   "state": customerList[id - 1].state,
    // };

    notifyListeners();
  }

  Future<void> editCustomer(name, lastName, phone, email, address) async {
    // final data = {
    //   'nombre': name,
    //   'apellido': lastName,
    //   'telefono': phone,
    //   'email': email,
    //   'direccion': address,
    // };

    // final jsonData = jsonEncode(data);

    // var _id = customer["id"];
    // try {
    //   final response = await _dio.patch(
    //     '${APIConfig.apiUrl}/clientes/$_id',
    //     data: jsonData,
    //   );

    //   if (response.statusCode == 201) {
    //     print('Cliente creado exitosamente');
    //     print('Respuesta: ${response.data}');
    //     // Puedes realizar alguna acción adicional si es necesario
    //   } else {
    //     print('Error al crear el cliente');
    //     print('Código de estado: ${response.statusCode}');
    //     print('Mensaje de error: ${response.statusMessage}');
    //   }
    // } catch (error) {
    //   print('Error al edita el cliente: $error');
    // }

   

    notifyListeners();
  }

   Future<void> editStateProvider(id, state) async {
    // final data = {
    //   'estado': state,
    // };

    // final jsonData = jsonEncode(data);

    // try {
    //   final response = await _dio.patch(
    //     '${APIConfig.apiUrl}/clientes/estado/$id',
    //     data: jsonData,
    //   );

    //   if (response.statusCode == 201) {
    //     print('Estado modificado exitosamente');
    //     print('Respuesta: ${response.data}');
    //     // Puedes realizar alguna acción adicional si es necesario
    //   } else {
    //     print('Error al cambiar el estado');
    //     print('Código de estado: ${response.statusCode}');
    //     print('Mensaje de error: ${response.statusMessage}');
    //   }
    // } catch (error) {
    //   print('Error al cambiar el estado del cliente: $error');
    // }

    notifyListeners();
  }

  // Método getter para acceder al perfil
  Customer get customer => _customer;

}
