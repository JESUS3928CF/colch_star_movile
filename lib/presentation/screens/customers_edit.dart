// ignore_for_file: use_build_context_synchronously

import 'package:colch_stat_app/presentation/screens/customers_screen.dart';
import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class CustomersEdit extends StatefulWidget {
  const CustomersEdit({super.key});

  @override
  State<CustomersEdit> createState() => _CustomersEditState();
}

class _CustomersEditState extends State<CustomersEdit> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreController =
      TextEditingController(text: customerProvider.customer["name"]);

  final TextEditingController _apellidoController =
      TextEditingController(text: customerProvider.customer["lastName"]);

  final TextEditingController _telefonoController =
      TextEditingController(text: customerProvider.customer["phone"]);

  final TextEditingController _emailController =
      TextEditingController(text: customerProvider.customer["email"]);

  final TextEditingController _direccionController =
      TextEditingController(text: customerProvider.customer["address"]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBarColch()),
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
                          'Editar Cliente',
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
                        '!Editar cliente de colch star!',
                        style: TextStyle(fontSize: 17),
                      )),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  controller: _nombreController,
                                  decoration: const InputDecoration(
                                      hintText: 'Nombre',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w700),
                                      fillColor:
                                          Color.fromARGB(255, 221, 216, 216),
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
                                      return 'Por favor ingrese su nombre';
                                    }
                                    return null;
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  controller: _apellidoController,
                                  decoration: const InputDecoration(
                                      hintText: 'Apellidos',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w700),
                                      fillColor:
                                          Color.fromARGB(255, 221, 216, 216),
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
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor digite su apellido';
                                    }
                                    return null;
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  controller: _telefonoController,
                                  decoration: const InputDecoration(
                                      hintText: 'Teléfono',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w700),
                                      fillColor:
                                          Color.fromARGB(255, 221, 216, 216),
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
                                      return 'Por favor ingrese su Teléfono';
                                    }
                                    return null;
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w700),
                                      fillColor:
                                          Color.fromARGB(255, 221, 216, 216),
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
                                  controller: _direccionController,
                                  decoration: const InputDecoration(
                                      hintText: 'Dirección',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w700),
                                      fillColor:
                                          Color.fromARGB(255, 221, 216, 216),
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
                            Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: SizedBox(
                                      width: 100,
                                      height: 45,
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            String name =
                                                _nombreController.text;
                                            String lastName =
                                                _apellidoController.text;
                                            String phone =
                                                _telefonoController.text;
                                            String email =
                                                _emailController.text;
                                            String address =
                                                _direccionController.text;

                                            if (_formKey.currentState!
                                                .validate()) {
                                              customerProvider.editCustomer(
                                                  name,
                                                  lastName,
                                                  phone,
                                                  email,
                                                  address);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.check_circle,
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Cliente editado correctamente",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255)),
                                                    )
                                                  ],
                                                ),
                                                // duration:
                                                //     Duration(milliseconds: 2000),
                                                // width: 300,
                                                // padding: EdgeInsets.symmetric(
                                                //     horizontal: 8.0, vertical: 10),
                                                // behavior: SnackBarBehavior.floating,
                                                // shape: RoundedRectangleBorder(
                                                //   borderRadius: BorderRadius.circular(9.0),
                                                // ),
                                                // backgroundColor:
                                                //     Color.fromARGB(255, 0, 119, 62),
                                              ));
                                            }

                                            await customerProvider
                                                .getCustomers();

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const CustomersScreen()));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .green, // background (button) color
                                            foregroundColor: Colors
                                                .white, // foreground (text) color
                                          ),
                                          child: const Text('Agregar')),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Lógica para cancelar aquí
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CustomersScreen()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .red, // Puedes cambiar el color según tus preferencias
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text('Cancelar'),
                                  ),
                                ),
                              ],
                            ),
                            // Añade un espacio entre los botones
                          ],
                        ))
                  ],
                ))),
        drawer: SideMenu(navDrawerIndex: 2));
  }
}
