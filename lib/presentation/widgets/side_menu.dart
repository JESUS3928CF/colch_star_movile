import 'package:flutter/material.dart';
import 'package:colch_stat_app/presentation/providers/profile_provider.dart';
import 'package:colch_stat_app/presentation/screens/customers_screen.dart';
import 'package:colch_stat_app/presentation/screens/login_creen.dart';
import 'package:colch_stat_app/presentation/screens/sales_screen.dart';

class SideMenu extends StatefulWidget {
  int? navDrawerIndex = 0;
  SideMenu({super.key, this.navDrawerIndex});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (profileProviderSingleton.profileProvider.profile.name.isEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(title: "...."),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Color getMenuItemColor(int index) {
    return index == widget.navDrawerIndex ? Colors.blue : Colors.white; // Cambia el color aquí según la opción seleccionada
  }

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    const TextStyle menuTextStyle =
        TextStyle(fontWeight: FontWeight.w800, fontSize: 24, color: Colors.white);

    const TextStyle menuItemsTextStyle =
        TextStyle(fontWeight: FontWeight.w500, fontSize: 20);

    return Drawer(
      child: Container(
        color: const Color(0xFF14131B),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, hasNotch ? 25 : 25, 0, 0,),
              child: Center(
                child: Text(
                  "${profileProviderSingleton.profileProvider.profile.name} ${profileProviderSingleton.profileProvider.profile.lastName}",
                  style: menuTextStyle,
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.add_shopping_cart_sharp, color: getMenuItemColor(0), size: 30),
              title: Text(
                'Ordenes',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: getMenuItemColor(0),
                ),
              ),
              onTap: () {
                setState(() {
                  widget.navDrawerIndex = 0;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SalesScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: getMenuItemColor(1), size: 30),
              title: Text(
                'Clientes',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: getMenuItemColor(1),
                ),
              ),
              onTap: () {
                setState(() {
                  widget.navDrawerIndex = 1;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CustomersScreen()),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 20),
              child: const Text(
                "Más acciones",
                style: menuTextStyle,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: Colors.white, size: 30),
              title: Text(
                'Cerrar sesión',
                style: menuItemsTextStyle.copyWith(color: Colors.white),
              ),
              onTap: () {

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "¿Deseas salir de tu cuenta?",
                        textAlign: TextAlign.center,
                      ),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: const Color(0xFF252432),
                              foregroundColor: Colors
                                  .white, // White text for dark background
                              child: Text("No"),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            SizedBox(width: 16), // Espacio entre los botones
                            FloatingActionButton(
                              backgroundColor: const Color(0xFF47684e),
                              foregroundColor: Colors.white,
                              child: Text("Sí"),
                              onPressed: () {
                                
                                profileProviderSingleton.profileProvider
                                    .singOff();

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyApp()),
                                );
                                // Aquí colocas la lógica para cambiar el estado del cliente
                                // Navigator.of(context).pop();

                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
                
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
