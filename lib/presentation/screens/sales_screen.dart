import 'package:colch_stat_app/presentation/screens/customers_screen.dart';
import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import '../providers/sale_provider.dart';
import 'sales_create.dart';

// const Sales = <Map<String, dynamic>>[
//   {
//     'elevation': 4.0,
//     '_Producto': 'Camisa',
//     '_Cantidad': '3',
//     '_Precio': '35.000',
//     '_FechaDeEntrega': '14/12/24',
//     '_Descripcion': 'Camisa sin estampado',
//     '_Cliente': 'Juan',
//     'state': true,
//   },
//   {
//     'elevation': 4.0,
//     '_Producto': 'Briana',
//     '_Cantidad': 'Dispareja',
//     '_Precio': '32341231',
//     '_FechaDeEntrega': 'Briana@gmail.com',
//     '_Descripcion': 'Calle 20 # 80-20',
//     '_Cliente': 'Juan',
//     'state': true,
//   },
//   {
//     'elevation': 4.0,
//     '_Producto': 'Herlyn',
//     '_Cantidad': 'Jose',
//     '_Precio': '32341231',
//     '_FechaDeEntrega': 'herlyn@gmail.com',
//     '_Descripcion': 'Calle 20 # 80-20',
//     '_Cliente': 'Juan',
//     'state': false,
//   },
//   {
//     'elevation': 4.0,
//     '_Producto': 'Tomas',
//     '_Cantidad': 'Sanchez',
//     '_Precio': '32341231',
//     '_FechaDeEntrega': 'tomas@gmail.com',
//     '_Descripcion': 'Calle 20 # 80-20',
//     '_Cliente': 'Juan',
//     'state': true,
//   },
//   {
//     'elevation': 4.0,
//     '_Producto': 'Brian',
//     '_Cantidad': 'Pareja',
//     '_Precio': '32341231',
//     '_FechaDeEntrega': 'brian@gmail.com',
//     '_Descripcion': 'Calle 20 # 80-20',
//     '_Cliente': 'Juan',
//     'state': false,
//   },
// ];

var saleProvider = SaleProvider();

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  void initState() {
    super.initState();
    // Llama al método async para cargar los clientes cuando se inicie la pantalla.
    loadSales();
  }

  // Método async para cargar los clientes.
  Future<void> loadSales() async {
    try {
      // Llama al método en customerProvider para cargar los clientes.
      await saleProvider.getSales();
      // Actualiza el estado para reconstruir la pantalla con los nuevos datos.
      setState(() {});
    } catch (error) {
      // Maneja cualquier error que pueda ocurrir durante la carga de clientes.
      print('Error al cargar la venta: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), child: AppBarColch()),
      body: _SalesView(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.person_add_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SalesCreate()),
            );
          }),
      drawer: SideMenu(
        navDrawerIndex: 1,
      ),
    );
  }
}

class _SalesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(17.0),
            child: Text(
              "Lista de ventas",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          ...saleProvider.saleList.map((sale) => _CardSale(
                elevation: 4.0,
                id: sale.id,
                product: sale.product,
                amountProduct: sale.amountProduct,
                montTotal: sale.montTotal,
                time: sale.time,
                description: sale.description,
                state: sale.state,
                fksale: sale.fksale,
              ))
        ],
      ),
    );
  }
}

const textCardStyle = TextStyle(fontSize: 17);
const labelCardStyle = TextStyle(
  fontSize: 20,
);

class _CardSale extends StatefulWidget {
  final int id;
  final String product;
  final int amountProduct;
  final String montTotal;
  final DateTime time;
  final String description;
  final int fksale;
  bool state;
  final double elevation;

  _CardSale({
    required this.id,
    required this.product,
    required this.amountProduct,
    required this.montTotal,
    required this.time,
    required this.description,
    required this.state,
    required this.fksale,
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
        // ignore: prefer_const_constructors
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
                  '${widget.product} ',
                  style: labelCardStyle,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Cantidad : ${widget.amountProduct}',
                  style: textCardStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Precio Total: ${widget.montTotal}',
                  style: textCardStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Fecha De Entrega: : ${widget.time}',
                  style: textCardStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Descripción: ${widget.description} ${widget.fksale}',
                  style: textCardStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Id Cliente: ${widget.fksale}',
                  style: textCardStyle,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.edit_sharp,
                    color: Color.fromARGB(255, 7, 135, 194),
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 100,
                ),
                IconButton(
                  icon: widget.state
                      ? const Icon(
                          Icons.toggle_off,
                          color: Color.fromARGB(255, 7, 135, 194),
                        )
                      : const Icon(Icons.toggle_off,
                          color: Color.fromARGB(255, 194, 29, 7)),
                  onPressed: () {
                    setState(() {
                      widget.state = !widget.state;
                    });
                  },
                ),

                // SwitchListTile(value: true, onChanged: (value) {})
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
