import 'package:colch_stat_app/presentation/providers/customer_provider.dart';
import 'package:colch_stat_app/presentation/providers/profile_provider.dart';
import 'package:colch_stat_app/presentation/screens/customers_edit.dart';
import 'package:colch_stat_app/presentation/screens/login_creen.dart';
import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'customers_create.dart';


class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
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
    // Llama al método async para cargar los clientes cuando se inicie la pantalla.
    loadCustomers();
  }

  // Método async para cargar los clientes.
 Future<void> loadCustomers() async {
  try {
    // Llama al método en customerProvider para cargar los clientes.
    await customerProviderSingleton.customerProvider.getCustomers();
    
    // Obtén el primer cliente de la lista (si hay alguno) y muestra su nombre
    if (customerProviderSingleton.customerProvider.customerList.isNotEmpty) {
      String primerNombre = customerProviderSingleton.customerProvider.customerList[0].name;
      print('El nombre del primer cliente es: $primerNombre');
    }

    // Actualiza el estado para reconstruir la pantalla con los nuevos datos.
    setState(() {});
  } catch (error) {
    // Maneja cualquier error que pueda ocurrir durante la carga de clientes.
    print('Error al cargar clientes: $error');
  }
}
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBarColch()),
        body: _CustomerView(),
        floatingActionButton: FloatingActionButton(
            foregroundColor: const Color.fromARGB(255, 255, 255, 255), 
            backgroundColor: const Color(0xFF47684e),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CustomersCreate()),
              );
            },
            child: const Icon(Icons.person_add_outlined)),
        drawer: SideMenu(navDrawerIndex: 1));
  }
}

class _CustomerView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(17.0),
            child: Text(
              "Lista de clientes",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          ...customerProviderSingleton.customerProvider.customerList.map((customer) => _CardCustomer(
                elevation: 4.0,
                id: customer.id,
                name: customer.name,
                lastName: customer.lastName,
                phone: customer.phone,
                email: customer.email,
                address: customer.address,
                state: customer.state,
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

class _CardCustomer extends StatefulWidget {
  final int id;
  final String name;
  final String? lastName;
  final String phone;
  final String email;
  final String address;
  bool state;
  final double elevation;

  _CardCustomer(
      {required this.id,
      required this.name,
      required this.elevation,
      this.lastName,
      required this.phone,
      required this.email,
      required this.address,
      required this.state});

  @override
  State<_CardCustomer> createState() => _CardCustomerState();
}

class _CardCustomerState extends State<_CardCustomer> {
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
                  '${widget.name} ${widget.lastName}',
                  style: labelCardStyle,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Teléfono: ${widget.phone}',
                  style: textCardStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Email: : ${widget.email}',
                  style: textCardStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Dirección: : ${widget.address}',
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
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomersEdit()),
                    );

                    customerProviderSingleton.customerProvider.setCustomer(widget.id);

                    // customerProvider.editCustomer(widget.id , widget.name, widget.lastName, widget.phone, widget.email, widget.address);
                  },
                ),
                const SizedBox(
                  width: 100,
                ),
                IconButton(
                  icon: widget.state
                      ? const Icon(
                          Icons.toggle_off,
                          color: Color(0xFF60d480),
                        )
                      : const Icon(Icons.toggle_off,
                          color: Color.fromARGB(255, 194, 29, 7)),
                  onPressed: () async {
                    setState(() {
                      widget.state = !widget.state;
                    });

                    await customerProviderSingleton.customerProvider.editStateProvider(
                        widget.id, !widget.state);
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
