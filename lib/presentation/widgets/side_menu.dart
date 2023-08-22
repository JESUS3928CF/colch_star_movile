import 'package:colch_stat_app/main.dart';
import 'package:colch_stat_app/presentation/screens/customers_screen.dart';
import 'package:colch_stat_app/presentation/screens/index_screen.dart';
import 'package:colch_stat_app/presentation/screens/profile_screen.dart';
import 'package:colch_stat_app/presentation/screens/sales_screen.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  int? navDrawerIndex = 3;
  SideMenu({Key? key,  this.navDrawerIndex}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
        //* Opción para saber que pagina esta seleccionada
        selectedIndex: widget.navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
             widget.navDrawerIndex = value;
          });

          switch (value) {
            case 0: // Dashboard
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IndexScreen()),
              );
              break;
            case 1: // Ventas
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SalesScreen()),
              );
              break;
            case 2: // Clientes
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CustomersScreen()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
              break;
          }
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 20),
            child: const Text("Menú principal"),
          ),
          const NavigationDrawerDestination(
              icon: Icon(Icons.dashboard), label: Text('Dashboard')),
          const NavigationDrawerDestination(
              icon: Icon(Icons.add_shopping_cart_sharp), label: Text('Ventas')),
          const NavigationDrawerDestination(
              icon: Icon(Icons.person), label: Text('Clientes')),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 20),
            child: const Text("Más acciones"),
          ),
          const NavigationDrawerDestination(
              icon: Icon(Icons.account_circle), label: Text('Mi perfil')),
          const NavigationDrawerDestination(
              icon: Icon(Icons.logout_rounded), label: Text('Cerrar sección')),
        ]);
  }
}
