import 'package:colch_stat_app/infrastruture/alerts/alertHelper.dart';
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
    // Llama al método async para cargar los clientes cuando se inicie la pantalla.
    loadCustomers();
  }

  // Método async para cargar los clientes.
  Future<void> loadCustomers() async {
    try {
      // Llama al método en customerProvider para cargar los clientes.
      await customerProviderSingleton.customerProvider.getCustomers();
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Lógica para mostrar la SnackBar después de que se haya completado la construcción del widget
      if (customerProviderSingleton.customerProvider.error != "") {
        AlertHelper.showMessageSnackBar(
          context,
          customerProviderSingleton.customerProvider.error,
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
              "Lista de clientes",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          ...customerProviderSingleton.customerProvider.customerList
              .map((customer) => _CardCustomer(
                    elevation: 4.0,
                    id: customer.id,
                    name: customer.name,
                    lastName: customer.lastName,
                    phone: customer.phone,
                    email: customer.email,
                    address: customer.address,
                    identification: customer.identification,
                    typeidentification: customer.typeidentification,
                    state: customer.state,
                  ))
        ],
      ),
    );
  }
}



const textCardStyle = TextStyle(fontSize: 18, color: Colors.black);

const labelCardStyle = TextStyle(
  fontSize: 20,
);

const textContentCardStyle =
    TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);

class _CardCustomer extends StatefulWidget {
  final int id;
  final String name;
  final String? lastName;
  final String phone;
  final String email;
  final String address;
  final String identification;
  final String typeidentification;
  bool state;
  final double elevation;

  _CardCustomer(
      {required this.id,
      required this.name,
      required this.elevation,
      required this.lastName,
      required this.phone,
      required this.email,
      required this.address,
      required this.identification,
      required this.typeidentification,
      required this.state});

  @override
  State<_CardCustomer> createState() => _CardCustomerState();
}

class _CardCustomerState extends State<_CardCustomer> {
  void _toggleState() {
    setState(() {
      widget.state = !widget.state;
    });
  }

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
                  'Identificación: ${widget.typeidentification} ${widget.identification}',
                  style: textCardStyle,
                ),
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
                  'Correo electrónico: ${widget.email}',
                  style: textCardStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Dirección: ${widget.address}',
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
                    if (widget.state == false) {
                      AlertHelper.showMessageSnackBar(context,
                          "Este cliente no se puede editar porque está inhabilitado");
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomersEdit()),
                      );

                      customerProviderSingleton.customerProvider
                          .setCustomer(widget.id);
                    }

                    // customerProvider.editCustomer(widget.id , widget.name, widget.lastName, widget.phone, widget.email, widget.address);
                  },
                ),
                const SizedBox(
                  width: 100,
                ),
                IconButton(
                  icon: Icon(
                    Icons.toggle_off,
                    color: widget.state
                        ? const Color(0xFF60d480)
                        : const Color.fromARGB(255, 194, 29, 7),
                  ),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("¿Cambiar estado del cliente?"),
                          content: Text(
                              "¿Estás seguro de que deseas ${widget.state? "inhabilitar" : "habilitar"} este cliente?"),
                          actions: <Widget>[
                            FloatingActionButton(
                              backgroundColor: const Color(0xFF252432),
                              foregroundColor: Colors
                                  .white, // White text for dark background
                              child: Text("No"),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            FloatingActionButton(
                              backgroundColor: const Color(0xFF47684e),
                              foregroundColor: Colors.white,
                              child: Text("Sí"),
                              onPressed: () async {

                                    print(widget.state);

                                await customerProviderSingleton.customerProvider
                                    .editStateProvider(widget.state, widget.id);



                                if (customerProviderSingleton
                                            .customerProvider.error ==
                                        "" &&
                                    customerProviderSingleton
                                            .customerProvider.success !=
                                        "") {
                                  AlertHelper.showMessageSnackBar(
                                      context,
                                      customerProviderSingleton
                                          .customerProvider.success,
                                      false);

                                  _toggleState();

                                  customerProviderSingleton.customerProvider
                                      .cleanSuccess();
                                } else {
                                  AlertHelper.showMessageSnackBar(
                                      context,
                                      customerProviderSingleton
                                          .customerProvider.error);

                                  customerProviderSingleton.customerProvider
                                      .cleanError();
                                }
                                // Aquí colocas la lógica para cambiar el estado del cliente
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
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
