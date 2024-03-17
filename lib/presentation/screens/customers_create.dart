import 'package:colch_stat_app/presentation/screens/customers_screen.dart';
import 'package:flutter/material.dart';
import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';

import '../providers/customer_provider.dart';

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
  final _identification = TextEditingController();
  final List<String> _typeidentification = ['C.C.', 'C.E.'];
  String _selectedTypeIdentification = 'C.C.';


  @override
  Widget build(BuildContext context) {
    // final customerProvider = Provider.of<CustomerProvider>(context);

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
                    'Agregar cliente',
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
                padding: const EdgeInsets.only(top: 20),
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
                        controller: _identification,
                        decoration: const InputDecoration(
                            hintText: 'Identificación',
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
                            return 'Por favor, ingrese el numero de identificacion ';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            hintText: 'Nombres',
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
                            return 'Por favor, ingrese el nombre';
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
                            hintText: 'Apellidos',
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
                            return 'Por favor, ingrese el apellido';
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
                            return 'Por favor, ingrese el teléfono';
                          }
                          return null;
                        },
                      ),
                    ),

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
                              return 'Por favor, ingrese la Dirección';
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
                          // validator: (value) {
                          //   String pattern =
                          //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          //   RegExp regExp = RegExp(pattern);
                          //   if (value!.isEmpty) {
                          //     return "El correo es necesario";
                          //   } else if (!regExp.hasMatch(value)) {
                          //     return "Correo invalido";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        )),
                    
                    // Resto de los campos de entrada aquí...

                    Row(
                      children: [
                        SizedBox(
                          width: 110,
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
                              backgroundColor: const Color(0xFF252432),
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Cancelar'),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: SizedBox(
                            width: 110,
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
                                  final identification= _identification.text;
                                  final typeidentification = _selectedTypeIdentification;

                                  // Llamar a la función para crear el cliente
                                  await customerProviderSingleton.customerProvider.createCustomer(
                                    name,
                                    lastName,
                                    phone,
                                    email,
                                    address,
                                    identification,
                                    typeidentification
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
                                backgroundColor: const Color(0xFF47684e),
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Guardar'),
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
