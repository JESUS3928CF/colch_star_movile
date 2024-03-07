import 'package:colch_stat_app/presentation/providers/profile_provider.dart';
import 'package:colch_stat_app/presentation/screens/customers_screen.dart';
import 'package:colch_stat_app/presentation/screens/index_screen.dart';
import 'package:colch_stat_app/presentation/screens/login_creen.dart';
import 'package:colch_stat_app/presentation/screens/profile_screen.dart';
import 'package:colch_stat_app/presentation/screens/sales_screen.dart';
import 'package:colch_stat_app/presentation/screens/recover_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  int? navDrawerIndex = 3;
  SideMenu({Key? key, this.navDrawerIndex}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  late ProfileProvider profileProvider; // Declara profileProvider aquí

  @override
  void initState() {
    super.initState();
    // Inicializa profileProvider en initState
    profileProvider = context.read<ProfileProvider>();
  }

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    const TextStyle menuTextStyle =
        TextStyle(fontWeight: FontWeight.w800, fontSize: 24, color: Colors.white);

    const TextStyle menuItemsTextStyle =
        TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white);

    return Drawer(
      child: Container(
        color: Color(0xFF14131B), // Color de fondo del menú
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(100, hasNotch ? 20 : 40, 16, 20),
              child: Text("Colch Star", style: menuTextStyle),
            ),
            ListTile(
              leading: Icon(Icons.add_shopping_cart_sharp, color: Colors.white, size: 30),
              title: Text(
                'Ordenes',
                style: menuItemsTextStyle,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SalesScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.white, size: 30),
              title: Text(
                'Clientes',
                style: menuItemsTextStyle,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CustomersScreen()),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 20),
              child: Text(
                "Más acciones",
                style: menuTextStyle,
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded, color: Colors.white, size: 30),
              title: Text(
                'Cerrar sesión',
                style: menuItemsTextStyle,
              ),
              onTap: () {
                profileProvider.singOff();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
