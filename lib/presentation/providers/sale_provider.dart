import 'package:colch_stat_app/domain/entities/order.dart';
import 'package:colch_stat_app/infrastruture/datasources/api_order_datasource_imp.dart';
import 'package:colch_stat_app/infrastruture/errors/custom_error.dart';
import 'package:colch_stat_app/infrastruture/repositories/order_repository_imp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class SaleProvider extends ChangeNotifier {
  // final _dio = Dio(BaseOptions());

  final OrdersRepositoryImpl orderRepository;

  /// Si vas a manejar varios elementos de el mismo tipo aca harías un atributo de tipo array
  List<Order> _orderList = []; //* esto es una lista de entidades de usuarios

  int totalSales = 0;

  String _error = "";

  SaleProvider({required this.orderRepository});

  //! Esta petición no se una para el perfil pero es un ejemplo de como traer varios registros
  Future<void> getSales() async {
    try {
      List<Order> orders = await orderRepository.getOrders();
      List<Order> invertedOrders = orders.reversed.toList();
      _orderList = invertedOrders;

      totalSales = _orderList.length;

      notifyListeners();
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
      _error = ("Error no controlado: $e");
      // Aquí puedes tomar otras acciones adecuadas
    }
  }

  void emptyOrders() {
    _orderList = [];
    notifyListeners();
  }

  void cleanError() {
    _error = "";
    notifyListeners();
  }

  /// Setters
  
   List<Order> get orderList => _orderList;
  
  String get error => _error;
}

/// Instanciar el provider una sola ves en toda la app
class OrderProviderSingleton {
  /// Creación de una única instancia del repositorio que se usara.
  static final OrdersRepositoryImpl orderRepository =
      OrdersRepositoryImpl(orderDataSource: ApiOrderDataSourceImpl());

  /// Declaración de la única instancia de CustomerProviderSingleton como privada y estática.
  static final OrderProviderSingleton _instance =
      OrderProviderSingleton._internal();

  /// Constructor de fábrica privado para crear o devolver la instancia única de CustomerProviderSingleton.
  factory OrderProviderSingleton() {
    return _instance;
  }

  /// Constructor privado interno para evitar la creación de instancias desde fuera de la clase.
  OrderProviderSingleton._internal();

  /// Método estático para obtener la instancia única de CustomerProviderSingleton.
  static OrderProviderSingleton get instance => _instance;

  /// Propiedad para almacenar la instancia de CustomerProvider.
  final SaleProvider _orderProvider =
      SaleProvider(orderRepository: orderRepository);

  /// Método getter para obtener la instancia de CustomerProvider.
  SaleProvider get orderProvider => _orderProvider;
}

/// 1)  Instanciar el CustomerProviderSingleton y donde lo necesitemos lo importamos
final orderProviderSingleton = OrderProviderSingleton.instance;
