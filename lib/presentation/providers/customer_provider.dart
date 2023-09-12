import 'package:colch_stat_app/domain/entities/customer.dart';
import 'package:colch_stat_app/infrastruture/models/customer_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class CustomerProvider extends ChangeNotifier {
  final _dio = Dio(BaseOptions());

  /// Si vas a manejar varios elementos de el mismo tipo aca harías un atributo de tipo array
  List<Customer> customerList = []; //* esto es una lista de entidades de usuarios

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
 
}
