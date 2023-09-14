import 'package:colch_stat_app/presentation/providers/sales_provider.dart';
import 'package:colch_stat_app/presentation/screens/sales_edit.dart';
import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';
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
// <<<<<<< HEAD
//     '_Producto': 'Buso',
//     '_Cantidad': '3',
//     '_Precio': '75.000',
//     '_FechaDeEntrega': '05/09/24',
//     '_Descripcion': 'Buso con estampado',
// =======
//     '_Producto': 'Briana',
//     '_Cantidad': 'Dispareja',
//     '_Precio': '32341231',
//     '_FechaDeEntrega': 'Briana@gmail.com',
//     '_Descripcion': 'Calle 20 # 80-20',
//     '_Cliente': 'Juan',
// >>>>>>> main
//     'state': true,
//   },
//   {
//     'elevation': 4.0,
// <<<<<<< HEAD
//     '_Producto': 'Camiseta',
//     '_Cantidad': '2',
//     '_Precio': '45.000',
//     '_FechaDeEntrega': '10/09/24',
//     '_Descripcion': 'Camiseta con estampados por ambos lados',
// =======
//     '_Producto': 'Herlyn',
//     '_Cantidad': 'Jose',
//     '_Precio': '32341231',
//     '_FechaDeEntrega': 'herlyn@gmail.com',
//     '_Descripcion': 'Calle 20 # 80-20',
//     '_Cliente': 'Juan',
// >>>>>>> main
//     'state': false,
//   },
//   {
//     'elevation': 4.0,
// <<<<<<< HEAD
//     '_Producto': 'Buso y camisa',
//     '_Cantidad': '1',
//     '_Precio': '150.000',
//     '_FechaDeEntrega': '04/09/24',
//     '_Descripcion': 'El buso y la camisa contiene estampados',
// =======
//     '_Producto': 'Tomas',
//     '_Cantidad': 'Sanchez',
//     '_Precio': '32341231',
//     '_FechaDeEntrega': 'tomas@gmail.com',
//     '_Descripcion': 'Calle 20 # 80-20',
//     '_Cliente': 'Juan',
// >>>>>>> main
//     'state': true,
//   },
//   {
//     'elevation': 4.0,
// <<<<<<< HEAD
//     '_Producto': 'Buso',
//     '_Cantidad': '1',
//     '_Precio': '85.000',
//     '_FechaDeEntrega': '23/08/24',
//     '_Descripcion': 'Buso con estampados ambos lados',
// =======
//     '_Producto': 'Brian',
//     '_Cantidad': 'Pareja',
//     '_Precio': '32341231',
//     '_FechaDeEntrega': 'brian@gmail.com',
//     '_Descripcion': 'Calle 20 # 80-20',
//     '_Cliente': 'Juan',
// >>>>>>> main
//     'state': false,
//   },
// ];


 var salesProviders = SaleProvider();


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
      await salesProviders.getSales();
      // Actualiza el estado para reconstruir la pantalla con los nuevos datos.
      setState(() {});
    } catch (error) {
      // Maneja cualquier error que pueda ocurrir durante la carga de clientes.
      print('Error al cargar de ventas: $error');
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
        navDrawerIndex: 2,
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
          ...salesProviders.salesList.map((sale) => _CardSales(
                elevation: 4.0,
                id: sale.id,
                products: sale.products,
                amountProducts: sale.amountProducts,
                price: sale.price,
                deliverDate:sale.deliverDate,
                description:sale.description,
                state: sale.state,
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

class _CardSales extends StatefulWidget {

  late final int id;
  late final String products;
  late final int amountProducts;
  late final double price;
  late final DateTime deliverDate;
  late final String description;
  late final bool state;
  late final double elevation;

  _CardSales(

      {
      required this.id,
      required this.products,
      required this.amountProducts,
      required this.price,
      required this.deliverDate,
      required this.description,
      required this.state,
      required this.elevation
      });

  @override
  State<_CardSales> createState() => _CardSalesState();
}

class _CardSalesState extends State<_CardSales> {
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
                  '${widget.products}',
                  style: labelCardStyle,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Cantidad : ${widget.amountProducts}',
                  style: textCardStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Precio Total: ${widget.price}',
                  style: textCardStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Fecha De Entrega: : ${widget.deliverDate}',
                  style: textCardStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Descripción: : ${widget.description}',
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
                  onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SalesEdit()),);},
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
