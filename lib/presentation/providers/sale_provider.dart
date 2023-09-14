

import 'package:colch_stat_app/infrastruture/models/sale_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/sales.dart';

class SaleProvider extends ChangeNotifier {
  final _dio = Dio(BaseOptions());

  /// Si vas a manejar varios elementos de el mismo tipo aca harías un atributo de tipo array
  List<Sales> saleList =
      []; //* esto es una lista de entidades de usuarios

  /// Propiedad a llenar si alguien se loguea
  Map<dynamic, dynamic> sales = {
    "id": "",
    "product": "",
    "amountproduct": "",
    "totalamount": "",
    "time": "",
    "description": "",
    "state": "",
    "fk_cliente":"",
  };

  /// Propiedad a llenar alguien intenta loguearse pero comete errores
  Map<String, dynamic> errores = {"messageEmail": "", "messagePassword": ""};

  //! Esta petición no se una para el perfil pero es un ejemplo de como traer varios registros
  Future<void> getSales() async {
    final response = await _dio.get("http://localhost:3000/api/ventas");

    print("Cnsultando ventas");
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final List<Sales> newSale = data
          .map((sale) => SaleModel.fromJson(sale).toProfileEntity())
          .toList();

      saleList
          .clear(); // Limpia la lista existente antes de agregar los nuevos perfiles.
      saleList.addAll(newSale);

      notifyListeners();
      print("Cnsultando venta");
      print(saleList[0].product);
    } else {
      // Manejar el error aquí si es necesario
    }
  }

  // Future<void> createCustomer(name, lastName, phone, email, address) async {
  //   final data = {
  //     'nombre': name,
  //     'apellido': lastName,
  //     'telefono': phone,
  //     'email': email,
  //     'direccion': address,
  //   };

  //   final jsonData = jsonEncode(data);

  //   try {
  //     final response = await _dio.post(
  //       'http://localhost:3000/api/clientes',
  //       data: jsonData,
  //     );

  //     if (response.statusCode == 201) {
  //       print('Cliente creado exitosamente');
  //       print('Respuesta: ${response.data}');
  //       // Puedes realizar alguna acción adicional si es necesario
  //     } else {
  //       print('Error al crear el cliente');
  //       print('Código de estado: ${response.statusCode}');
  //       print('Mensaje de error: ${response.statusMessage}');
  //     }
  //   } catch (error) {
  //     print('Error al crear el cliente: $error');
  //   }
  // }

  
}
