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
    final response = await _dio.get("http://localhost:3000/api/clientes");

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

  Future<void> editCustomer(id, name, lastName, phone, email, address) async {
// Datos que deseas enviar en el cuerpo de la solicitud
    final data = {
      'nombre': name,
      'apellido': lastName,
      'telefono': phone,
      'email': email,
      'direccion': address
    };

    //- Codifica los datos en formato JSON
    final jsonData = jsonEncode(data);

    try {
      final response = await _dio.patch(
        'http://localhost:3000/api/clientes/$id', // URL de la API
        data: data, // Datos que deseas enviar en el cuerpo del PATC
      );

      // Verifica si la respuesta fue exitosa (código de estado 2xx)
      if (response.statusCode == 200) {
        print('Solicitud PATCH exitosa');
        print('Respuesta: ${response.data}');
      } else {
        print('Error en la solicitud PATCH');
        print('Código de estado: ${response.statusCode}');
        print('Mensaje de error: ${response.statusMessage}');
      }
    } catch (error) {
      // Manejo de errores en caso de que falle la solicitud
      print('Error en la solicitud PATCH: $error');
    }
  }

  Future<void> editCustomerState(id, state) async {
// Datos que deseas enviar en el cuerpo de la solicitud
    final data = {
      'estado': state,
    };

    //- Codifica los datos en formato JSON
    final jsonData = jsonEncode(data);

    try {
      final response = await _dio.patch(
        'http://localhost:3000/api/clientes/estado/$id', // URL de la API
        data: data, // Datos que deseas enviar en el cuerpo del PATC
      );

      // Verifica si la respuesta fue exitosa (código de estado 2xx)
      if (response.statusCode == 200) {
        print('Solicitud PATCH exitosa cambio de estado');
        print('Respuesta: ${response.data}');
      } else {
        print('Error en la solicitud PATCH');
        print('Código de estado: ${response.statusCode}');
        print('Mensaje de error: ${response.statusMessage}');
      }
    } catch (error) {
      // Manejo de errores en caso de que falle la solicitud
      print('Error en la solicitud PATCH: $error');
    }
  }

  void llenarCustomer(id) {

    print(" Metodo iniciando");
    // customerList
  //  
    for (int i = 0; i < customerList.length; i++) {
      if(customer[i].id == id){
        customer = {
      "id": customer["id"],
      "name": customer["name"],
      "lastName": customer["lastName"],
      "phone": customer["phone"],
      "email": customer["email"],
      "address": customer["address"],
      "state": customer["state"],
    };

print("Llenando customer");
print(customer);

    return notifyListeners();  
      }
    }

    
    
  }
  Future<void> createCustomer(name, lastName,  phone,  email,  address) async {
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
      'http://localhost:3000/api/clientes',
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

}
