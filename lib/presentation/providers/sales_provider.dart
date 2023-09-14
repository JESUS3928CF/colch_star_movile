import 'dart:convert';

import 'package:colch_stat_app/domain/entities/sales.dart';
import 'package:colch_stat_app/infrastruture/models/sales_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class SaleProvider extends ChangeNotifier {
  final _dio = Dio(BaseOptions());

  /// Si vas a manejar varios elementos de el mismo tipo aca harías un atributo de tipo array
  List<Sales> salesList =
      []; //* esto es una lista de entidades de usuarios

  /// Propiedad a llenar si alguien se loguea
  Map<dynamic, dynamic> sales = {
    "id": "",
    "products": "",
    "amountProducts": "",
    "price": "",
    "deliverDate": "",
    "description": "",
    "state": "",
  };

  /// Propiedad a llenar alguien intenta loguearse pero comete errores
  Map<String, dynamic> errores = {"messageEmail": "", "messagePassword": ""};

  //! Esta petición no se una para el perfil pero es un ejemplo de como traer varios registros
  Future<void> getSales() async {
    final response = await _dio.get("http://localhost:3000/api/ventas");
    print("Consultando Ventas");
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final List<Sales> newSales = data
          .map((sales) => SalesModel.fromJson(sales).toProfileEntity())
          .toList();

      salesList
          .clear(); // Limpia la lista existente antes de agregar los nuevos perfiles.
      salesList.addAll(newSales);

      notifyListeners();
      print("Consultando Ventas");
      print(salesList[0].products);
    } else {
      // Manejar el error aquí si es necesario
    }
  }


Future<void> createSales(products, amountProducts,price, deliverDate,  description) async {
  final data = {
    'Producto': products,
    'Cantidad': amountProducts,
    'Precio Total': price,
    'Fecha de entrega': deliverDate,
    'direccion': description,
  };

  final jsonData = jsonEncode(data);

  try {
    final response = await _dio.post(
      'http://localhost:3000/api/ventas',
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