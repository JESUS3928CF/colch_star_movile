// ignore_for_file: prefer_const_constructors
import 'package:colch_stat_app/presentation/providers/customer_provider.dart';
import 'package:colch_stat_app/presentation/screens/customers_screen.dart';
import 'package:colch_stat_app/presentation/screens/sales_screen.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          /// Así aliemos este row al final
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
            Padding(
              /// de esta forma damos padding horizontal a un widget
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Colch Star",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            )
          ],
        ),
      ),
      body: const Center(
        child: DashboardView(),
      ),
      drawer: SideMenu(navDrawerIndex: 0),
    );
  }
}

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  void initState() {
    super.initState();
    // Llama al método async para cargar los clientes cuando se inicie la pantalla.
    loadCustomers();
  }

  // Método async para cargar los clientes.
  Future<void> loadCustomers() async {
    try {
      // Llama al método en customerProvider para cargar los clientes.
      await customerProviderSingleton.customerProvider.getCustomers();

      /// se comenta para que no de error
      // await saleProvider.getSales();

      // Actualiza el estado para reconstruir la pantalla con los nuevos datos.
      setState(() {});
    } catch (error) {
      // Maneja cualquier error que pueda ocurrir durante la carga de clientes.
      print('Error al cargar clientes: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DashboardBox(
            label: 'Clientes',
            icon: Icons.people,
            total: customerProviderSingleton.customerProvider.totalClients),
        SizedBox(height: 20),
        DashboardBox(
            label: 'Ordenes',
            icon: Icons.attach_money,
            total: saleProvider.totalSales),
      ],
    ));
  }
}

class DashboardBox extends StatelessWidget {
  final String label;
  final IconData icon;
  final int total;

  const DashboardBox({
    Key? key,
    required this.label,
    required this.icon,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            'Total: $total',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
