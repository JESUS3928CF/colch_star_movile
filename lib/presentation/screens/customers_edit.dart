// ignore_for_file: use_build_context_synchronously

import 'package:colch_stat_app/presentation/providers/customer_provider.dart';
import 'package:colch_stat_app/presentation/screens/customers_screen.dart';
import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomersEdit extends StatefulWidget {
  const CustomersEdit({super.key});

  @override
  State<CustomersEdit> createState() => _CustomersEditState();
}

class _CustomersEditState extends State<CustomersEdit> {
  late CustomerProvider customerProvider; // Declara profileProvider aquí

  final _formKey = GlobalKey<FormState>();
   final List<String> _typeidentification = ['C.C', 'C.E'];
  String _selectedTypeIdentification = 'C.C';

  late TextEditingController _nombreController;
  late TextEditingController _apellidoController;
  late TextEditingController _telefonoController;
  late TextEditingController _emailController;
  late TextEditingController _direccionController;
  late TextEditingController _identificationController;

  @override
  void initState() {
    super.initState();
    // Inicializa profileProvider en initState
    customerProvider = context.read<CustomerProvider>();

    // Inicializa los controladores aquí, después de haber inicializado customerProvider
    _nombreController =
        TextEditingController(text: customerProvider.customer.name);
    _apellidoController =
        TextEditingController(text: customerProvider.customer.lastName);
    _telefonoController =
        TextEditingController(text: customerProvider.customer.phone);
    _emailController =
        TextEditingController(text: customerProvider.customer.email);
    _direccionController =
        TextEditingController(text: customerProvider.customer.address);
    _identificationController =     TextEditingController(text: customerProvider.customer.identification);
    

  }


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
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                             Padding(
                padding: EdgeInsets.only(top: 20),
                child: DropdownButtonFormField<String>(
                  value: _selectedTypeIdentification,
                  items: _typeidentification.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedTypeIdentification = newValue!;
                    });
                  },
                ),
              ),
                             Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  controller: _identificationController,
                                  decoration: const InputDecoration(
                                      hintText: 'Idetificación',
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
                                      return 'Por favor ingrese su identificación';
                                    }
                                    return null;
                                  },
                                )),


                            Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  controller: _nombreController,
                                  decoration: const InputDecoration(
                                      hintText: 'Nombres',
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
                                Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                      hintText: 'Correo electrónico',
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
                            Row(
                              children: [
                                SizedBox(
                                  width: 110,
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
                                      backgroundColor: const Color(0xFF252432),
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text('Cancelar'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: SizedBox(
                                      width: 110,
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
                                            backgroundColor: Color(0xFF47684e),
                                            foregroundColor: Colors.white,
                                          ),
                                          child: const Text('Guardar')),
                                    )),
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
