import 'package:colch_stat_app/infrastruture/alerts/alertHelper.dart';
import 'package:colch_stat_app/presentation/providers/profile_provider.dart';
import 'package:colch_stat_app/presentation/providers/sale_provider.dart';
import 'package:colch_stat_app/presentation/screens/login_creen.dart';
import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  @override
  void initState() {
    super.initState();
    // Llama al método async para cargar los clientes cuando se inicie la pantalla.
    loadSales();
  }

  // Método async para cargar los clientes.
  Future<void> loadSales() async {
    try {
      // Llama al método en customerProvider para cargar los clientes.
      await orderProviderSingleton.orderProvider.getSales();
      // Actualiza el estado para reconstruir la pantalla con los nuevos datos.
      setState(() {});
    } catch (error) {
      // Maneja cualquier error que pueda ocurrir durante la carga de clientes.
      print('Error al cargar la orden: $error');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (profileProviderSingleton.profileProvider.profile.name.isEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(title: "nada"),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), child: AppBarColch()),
      body: _SalesView(),
      drawer: SideMenu(
        navDrawerIndex: 0,
      ),
    );
  }
}

class _SalesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Lógica para mostrar la SnackBar después de que se haya completado la construcción del widget
      if (orderProviderSingleton.orderProvider.error != "") {
        AlertHelper.showErrorSnackBar(
          context,
          orderProviderSingleton.orderProvider.error,
        );

        // vaciar error
      }
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(17.0),
            child: Text(
              "Lista de ordenes",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          ...orderProviderSingleton.orderProvider.orderList
              .map(
                (sale) => _CardSale(
                  elevation: 4.0,
                  id: sale.id,
                  totalPrice: sale.totalPrice,
                  address: sale.address,
                  creationDate: sale.creationDate,
                  deliverDate: sale.deliverDate,
                  orderStatus: sale.orderStatus,
                  clientName: sale.clientName,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

const textCardStyle = TextStyle(fontSize: 17,  color: Colors.black);

const textOrderStyle = TextStyle(fontSize: 17,  color: Colors.black);

const labelCardStyle = TextStyle(
  fontSize: 20,
);

class _CardSale extends StatefulWidget {
  final int id;
  final double totalPrice;
  final String address;
  final DateTime creationDate;
  final DateTime deliverDate;
  final String orderStatus;
  final String clientName;
  final double elevation;

  const _CardSale({
    required this.id,
    required this.totalPrice,
    required this.address,
    required this.creationDate,
    required this.deliverDate,
    required this.orderStatus,
    required this.clientName,
    required this.elevation,
  });

  @override
  State<_CardSale> createState() => _CardSaleState();
}

class _CardSaleState extends State<_CardSale> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            side: BorderSide(color: Colors.black)),
        elevation: widget.elevation,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Center(
                    child: Text(
                  '${widget.clientName} ',
                  style: labelCardStyle,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Precio Total: ',
                        style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.black),
                      ),
                      TextSpan(
                        text: '${widget.totalPrice}',
                        style: textCardStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Dirección: ',
                        style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.black),
                      ),
                      TextSpan(
                        text: '${widget.address}',
                        style: textCardStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Fecha de creación: ',
                        style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.black),
                      ),
                      TextSpan(
                        text: '${widget.creationDate}',
                        style: textCardStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Fecha de Entrega: ',
                        style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.black),
                      ),
                      TextSpan(
                        text: '${widget.deliverDate}',
                        style: textCardStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Estado orden: ',
                        style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.black),
                      ),
                      TextSpan(
                        text: '${widget.orderStatus}',
                        style: textCardStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    _showOrderDetails(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF252432)), // Color hexadecimal 252432
                  ),
                  child: const Text('Ver Detalles',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  //  ---------------------------------------detalle

  void _showOrderDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailsScreen(order: widget),
      ),
    );
  }
}

const titleOrderStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);


class OrderDetailsScreen extends StatelessWidget {
  final _CardSale order;

  const OrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF252432), // Color hexadecimal 252432
        title: Text(
          'Detalles orden',
          textAlign: TextAlign.center, // Para centrar el texto
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true, // Para centrar el título
        iconTheme: IconThemeData(color: Colors.white), // Cambia el color del icono aquí
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Producto: ',
                    style: titleOrderStyle,
                  ),
                  TextSpan(
                    text: '${order.totalPrice}',
                    style: textOrderStyle
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'cantidad: ',
                    style: titleOrderStyle,
                  ),
                  TextSpan(
                    text: '${order.address}',
                    style: textOrderStyle
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Talla: ',
                    style: titleOrderStyle,
                  ),
                  TextSpan(
                    text: '${order.creationDate}',
                    style: textOrderStyle
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Color: ',
                    style: titleOrderStyle,
                  ),
                  TextSpan(
                    text: '${order.deliverDate}',
                    style : textOrderStyle
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Descripción: ',
                    style: titleOrderStyle,
                  ),
                  TextSpan(
                    text: '${order.orderStatus}',
                    style: textOrderStyle
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
