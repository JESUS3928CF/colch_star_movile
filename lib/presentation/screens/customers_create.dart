import 'package:colch_stat_app/presentation/screens/customers_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';

import '../providers/customer_provider.dart';
import 'customers_screen.dart';

class CustomersCreate extends StatefulWidget {
  const CustomersCreate({super.key});

  @override
  State<CustomersCreate> createState() => _CustomersCreateState();
}

class _CustomersCreateState extends State<CustomersCreate> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final customerProvider = Provider.of<CustomerProvider>(context);

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), child: AppBarColch()),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 15, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: const Center(
                  child: Text(
                    'Agregar Cliente',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    '!Agregar nuevo cliente de colch star!',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            hintText: 'Nombre',
                            hintStyle: TextStyle(fontWeight: FontWeight.w700),
                            fillColor: Color.fromARGB(255, 221, 216, 216),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            filled: true),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor ingrese su nombre';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _lastNameController,
                        decoration: const InputDecoration(
                            hintText: 'Apellido',
                            hintStyle: TextStyle(fontWeight: FontWeight.w700),
                            fillColor: Color.fromARGB(255, 221, 216, 216),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            filled: true),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor ingrese su nombre';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                            hintText: 'Teléfono',
                            hintStyle: TextStyle(fontWeight: FontWeight.w700),
                            fillColor: Color.fromARGB(255, 221, 216, 216),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            filled: true),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, ingrese su nombre';
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(fontWeight: FontWeight.w700),
                              fillColor: Color.fromARGB(255, 221, 216, 216),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, style: BorderStyle.none),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, style: BorderStyle.none),
                              ),
                              filled: true),
                          validator: (value) {
                            String pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regExp = RegExp(pattern);
                            if (value!.isEmpty) {
                              return "El correo es necesario";
                            } else if (!regExp.hasMatch(value)) {
                              return "Correo invalido";
                            } else {
                              return null;
                            }
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          controller: _addressController,
                          decoration: const InputDecoration(
                              hintText: 'Dirección',
                              hintStyle: TextStyle(fontWeight: FontWeight.w700),
                              fillColor: Color.fromARGB(255, 221, 216, 216),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, style: BorderStyle.none),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, style: BorderStyle.none),
                              ),
                              filled: true),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Por favor ingrese su Dirección';
                            }
                            return null;
                          },
                        )),

                    // Resto de los campos de entrada aquí...

                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CustomersScreen()));
                              // Lógica para cancelar aquí
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF252432),
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Cancelar'),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: SizedBox(
                            width: 100,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // Obtener los valores de los campos de entrada
                                  final name = _nameController.text;
                                  final lastName = _lastNameController.text;
                                  final phone = _phoneController.text;
                                  final email = _emailController.text;
                                  final address = _addressController.text;

                                  // Llamar a la función para crear el cliente
                                  await customerProvider.createCustomer(
                                    name,
                                    lastName,
                                    phone,
                                    email,
                                    address,
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Cliente registrado correctamente",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                  );

                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CustomersScreen()));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF47684e),
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Agregar'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Añade un espacio entre los botones
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      drawer: SideMenu(navDrawerIndex: 2),
    );
  }
}
