import 'package:colch_stat_app/domain/entities/customer.dart';
import 'package:colch_stat_app/infrastruture/datasources/local_customer_datasourse_imp.dart';
import 'package:colch_stat_app/infrastruture/errors/custom_error.dart';
import 'package:colch_stat_app/infrastruture/repositories/customer_repository_imp.dart';
import 'package:flutter/widgets.dart';

class CustomerProvider extends ChangeNotifier {
  final CustomerRepositoryImpl customerRepository;

  List<Customer> _customerList =
      []; //* esto es una lista de entidades de usuarios

  final Customer _customer = Customer(
      id: 0,
      name: "",
      lastName: "",
      phone: "",
      email: "",
      address: "",
      state: false);

  int totalClients = 0;

  String _error = "";

  Map<String, dynamic> errores = {"messageEmail": "", "messagePassword": ""};

  CustomerProvider({required this.customerRepository});

  Future<void> getCustomers() async {



    try {
      _customerList = await customerRepository.getCustomers();

      // customerList.addAll(newCustomer);

      totalClients = _customerList.length;
      
    } on CustomError catch (e) {
      _error = e.message;
    } catch (e) {
      _error = "Error no controlado";
    }

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

  void emptyCustomers() {
    _customerList = [];
    notifyListeners();
  }

  // Método getter para acceder al perfil
  Customer get customer => _customer;

  List<Customer> get customerList => _customerList;

  String get error => _error;
}

/// Instanciar el provider una sola ves en toda la app
class CustomerProviderSingleton {
  /// Creación de una única instancia del repositorio que se usara.
  static final CustomerRepositoryImpl customerRepository =
      CustomerRepositoryImpl(customerDataSource: LocalCustomerDataSourceImpl());

  /// Declaración de la única instancia de CustomerProviderSingleton como privada y estática.
  static final CustomerProviderSingleton _instance =
      CustomerProviderSingleton._internal();

  /// Constructor de fábrica privado para crear o devolver la instancia única de CustomerProviderSingleton.
  factory CustomerProviderSingleton() {
    return _instance;
  }

  /// Constructor privado interno para evitar la creación de instancias desde fuera de la clase.
  CustomerProviderSingleton._internal();

  /// Método estático para obtener la instancia única de CustomerProviderSingleton.
  static CustomerProviderSingleton get instance => _instance;

  /// Propiedad para almacenar la instancia de CustomerProvider.
  final CustomerProvider _customerProvider =
      CustomerProvider(customerRepository: customerRepository);

  /// Método getter para obtener la instancia de CustomerProvider.
  CustomerProvider get customerProvider => _customerProvider;
}

/// 1)  Instanciar el CustomerProviderSingleton y donde lo necesitemos lo importamos
final customerProviderSingleton = CustomerProviderSingleton.instance;
