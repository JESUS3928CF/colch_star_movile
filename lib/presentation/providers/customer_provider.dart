import 'package:colch_stat_app/domain/entities/customer.dart';
import 'package:colch_stat_app/infrastruture/datasources/api_customer_datasource_imp.dart';
import 'package:colch_stat_app/infrastruture/datasources/local_customer_datasourse_imp.dart';
import 'package:colch_stat_app/infrastruture/errors/custom_error.dart';
import 'package:colch_stat_app/infrastruture/repositories/customer_repository_imp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class CustomerProvider extends ChangeNotifier {
  final CustomerRepositoryImpl customerRepository;

  List<Customer> _customerList =
      []; //* esto es una lista de entidades de usuarios

  Customer _customer = Customer(
      id: 0,
      name: "",
      lastName: "",
      phone: "",
      email: "",
      address: "",
      identification: "",
      typeidentification: "",
      state: true);

  int totalClients = 0;

  String _error = "";

  Map<String, dynamic> errores = {"messageEmail": "", "messagePassword": ""};

  CustomerProvider({required this.customerRepository});

  get id => null;

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

  Future<void> createCustomer(name, lastName, phone, email, address,
      String identification, String typeidentification) async {
    try {
      await customerRepository.createCustomer(name, lastName, phone, email,
          address, identification, typeidentification);
    } catch (e) {
      // Otros tipos de errores
      _error = ("Error no controlado: $e");
    }
  }

  /// Esto es para llenar el cliente que se va a editar
  void setCustomer(id) async {
    // customerList[id - 1];

    int indice = customerList.indexWhere((element) => element.id == id);

    _customer = Customer(
      id: customerList[indice].id,
      name: customerList[indice].name,
      lastName: customerList[indice].lastName,
      phone: customerList[indice].phone,
      email: customerList[indice].email,
      address: customerList[indice].address,
      identification: customerList[indice].identification,
      typeidentification: customerList[indice].typeidentification,
      state: customerList[indice].state,
    );

    print(_customerList[indice]);

    notifyListeners();
  }

  Future<void> editCustomer(name, lastName, phone, email, address,identification, typeidentification) async {
    try {

      // Asignar el resultado de copyWith() a _customer
      _customer = _customer.copyWith(
        name: name,
        lastName: lastName,
        phone: phone,
        email: email,
        address: address,
        identification: identification,
        typeidentification: typeidentification,
      );



      await customerRepository.editCustomer(_customer);
    } on CustomError catch (e) {
      // Manejar el error personalizado
     _error = e.message;
      // Aquí puedes tomar acciones específicas, como mostrar un mensaje al usuario, etc.
    } on DioError catch (e) {
      // Manejar el error de Dio
      if (e.response?.statusCode == 403) {
        // El servidor respondió con un código de estado 403
        _error = "Error 403: No tienes permiso para acceder al recurso.";
        // Aquí puedes mostrar un mensaje al usuario u otra acción adecuada
      } else {
        // Otro tipo de error de Dio
        _error = ("Error de Dio: ${e.message}");
        // Aquí puedes tomar otras acciones adecuadas
      }
    } catch (e) {
      // Otros tipos de errores
      _error =("Error no controlado: $e");
      // Aquí puedes tomar otras acciones adecuadas
    }
    notifyListeners();
  }

  Future<void> editStateProvider(state) async {

    try { 
      _customer = _customer.copyWith(
        state:  state
      );



      await customerRepository.editStateCustomer(_customer);


     } on CustomError catch (e) {
      // Manejar el error personalizado
     _error = e.message;
      // Aquí puedes tomar acciones específicas, como mostrar un mensaje al usuario, etc.
    } on DioError catch (e) {
      // Manejar el error de Dio
      if (e.response?.statusCode == 403) {
        // El servidor respondió con un código de estado 403
        _error = "Error 403: No tienes permiso para acceder al recurso.";
        // Aquí puedes mostrar un mensaje al usuario u otra acción adecuada
      } else {
        // Otro tipo de error de Dio
        _error = ("Error de Dio: ${e.message}");
        // Aquí puedes tomar otras acciones adecuadas
      }
    } catch (e) {
      // Otros tipos de errores
      _error =("Error no controlado: $e");
      // Aquí puedes tomar otras acciones adecuadas
    }
    
    

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
      CustomerRepositoryImpl(customerDataSource: ApiCustomerDataSourceImpl());

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
