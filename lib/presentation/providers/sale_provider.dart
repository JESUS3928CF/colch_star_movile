import 'dart:convert';

import 'package:colch_stat_app/domain/helpers/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../domain/entities/sale.dart';
import '../../infrastruture/models/sale_model.dart';

class SaleProvider extends ChangeNotifier {
  final _dio = Dio(BaseOptions());

  /// Si vas a manejar varios elementos de el mismo tipo aca harías un atributo de tipo array
  List<Sale> saleList = []; //* esto es una lista de entidades de usuarios

  /// Propiedad a llenar si alguien se loguea
  Map<dynamic, dynamic> sale = {
    "id": "",
    "product": "",
    "amountProduct": "",
    "montTotal": "",
    "time": "",
    "description": "",
    "state": "",
    "fksale": "",
  };

  int totalSales = 0;

  /// Propiedad a llenar alguien intenta loguearse pero comete errores
  Map<String, dynamic> errores = {"messageEmail": "", "messagePassword": ""};

  //! Esta petición no se una para el perfil pero es un ejemplo de como traer varios registros
  Future<void> getSales() async {
    final response = await _dio
        .get("${APIConfig.apiUrl}/ventas");

    print("Cosultando ventas");
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final List<Sale> newSale = data
          .map((sale) => SaleModel.fromJson(sale).toProfileEntity())
          .toList();

      saleList
          .clear(); // Limpia la lista existente antes de agregar los nuevos perfiles.
      saleList.addAll(newSale);

      totalSales = saleList.length;

      notifyListeners();
      print("Cnsultando ventas");
      print(saleList[0].fksale);
    } else {
      // Manejar el error aquí si es necesario
    }
  }

  Future<void> createSale(
      product, amountProduct, montTotal, time, description, fksale) async {
    final data = {
      'producto': product,
      'cantidad_producto': amountProduct,
      'monto_total': montTotal,
      'fecha_entrega': time,
      'descripcion': description,
      'fk_cliente': fksale,
    };

    final jsonData = jsonEncode(data);

    print("Esto es lo que se agrega");
    print(jsonData);

    try {
      final response = await _dio.post(
        '${APIConfig.apiUrl}/ventas',
        data: jsonData,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Venta creada exitosamente');
        print('Respuesta: ${response.data}');
        // Puedes realizar alguna acción adicional si es necesario
      } else {
        print('Error al crear la venta');
        print('Código de estado: ${response.statusCode}');
        print('Mensaje de error: ${response.statusMessage}');
      }
    } catch (error) {
      print('Error al crear la venta: $error');
    }

    notifyListeners();
  }

  void setSale(id) async {
    saleList[id - 1];

    sale = {
      "id": saleList[id - 1].id,
      "product": saleList[id - 1].product,
      "amountProduct": saleList[id - 1].amountProduct,
      "montTotal": saleList[id - 1].montTotal,
      "time": saleList[id - 1].time,
      "description": saleList[id - 1].description,
      "fksale": saleList[id - 1].fksale,
      "state": saleList[id - 1].state,
    };

    print(sale);

    notifyListeners();
  }

  Future<void> editSale(
      product, amountProduct, montTotal, time, description, fksale) async {
    final data = {
      'producto': product,
      'cantidad_producto': amountProduct,
      'monto_total': montTotal,
      'fecha_entrega': time,
      'descripcion': description,
      'fk_cliente': fksale,
    };

    final jsonData = jsonEncode(data);

    var _id = sale["id"];
    try {
      final response = await _dio.patch(
        '${APIConfig.apiUrl}/ventas/$_id',
        data: jsonData,
      );

      if (response.statusCode == 201) {
        print('Venta Editada exitosamente');
        print('Respuesta: ${response.data}');
        // Puedes realizar alguna acción adicional si es necesario
      } else {
        print('Error al editar la venta ');
        print('Código de estado: ${response.statusCode}');
        print('Mensaje de error: ${response.statusMessage}');
      }
    } catch (error) {
      print('Error al editar la venta $error');
    }

    notifyListeners();
  }

  Future<void> editStateSale(id, state) async {
    final data = {
      'estado': state,
    };

    final jsonData = jsonEncode(data);

    try {
      final response = await _dio.patch(
        '${APIConfig.apiUrl}/ventas/estado/$id',
        data: jsonData,
      );

      if (response.statusCode == 201) {
        print('Cambio de estado en venta exitosamente');
        print('Respuesta: ${response.data}');
        // Puedes realizar alguna acción adicional si es necesario
      } else {
        print('Error al cambiar estado de la venta ');
        print('Código de estado: ${response.statusCode}');
        print('Mensaje de error: ${response.statusMessage}');
      }
    } catch (error) {
      print('Error al cambiar el estado de la venta $error');
    }

    notifyListeners();
  }
}
