// ignore_for_file: use_build_context_synchronously

import 'package:colch_stat_app/infrastruture/alerts/alertHelper.dart';
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
  final List<String> selectTypeIdetification = ['C.C.', 'C.E.'];
  late String _selectedTypeIdentification =
      customerProvider.customer.typeidentification;

  late TextEditingController _nombreController;
  late TextEditingController _apellidoController;
  late TextEditingController _telefonoController;
  late TextEditingController _emailController;
  late TextEditingController _direccionController;
  late TextEditingController _identificationController;
  late TextEditingController _selectedTypeIdentificationController;

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
    _identificationController =
        TextEditingController(text: customerProvider.customer.identification);

    _selectedTypeIdentificationController = TextEditingController(
        text: customerProvider.customer.typeidentification);
  }

bool _isNameValidated = false;

String? validarEspaciosVacios(String value) {
  List<String> valueList = value.split('');

  if (valueList.every((letra) => letra == ' ')) {
    return 'No se pueden espacios vacíos';
  } else {
    return null;
  }
}

  bool _contenedorDeNumeros(String value) {
  String letrasConEspacios = r'^[a-zA-ZáéíóúÁÉÍÓÚ\s]+$'; // Incluye letras con tildes
  final RegExp regex = RegExp(letrasConEspacios);
  return regex.hasMatch(value);
}

  bool _espacios(String value) {
    return value.contains(RegExp(r'\s'));
  }

  bool _letras(String value) {
    if (value.isNotEmpty && !RegExp(r'^\d*\.?\d*$').hasMatch(value)) {
      return true;
    }
    return false;
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
                            Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
      SizedBox(
      width: MediaQuery.of(context).size.width * 0.3, // Ancho deseado para el DropdownButtonFormField
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: DropdownButtonFormField<String>(
                                    isExpanded: true, 

          value: _selectedTypeIdentification,
          items: selectTypeIdetification.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedTypeIdentification = newValue!;
              customerProvider.customer.typeidentification = newValue;
            });
          },
        ),
      ),
    ),
    Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: TextFormField(
          controller: _identificationController,
          autovalidateMode: _isNameValidated
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          onChanged: (value) {
            setState(() {
              _isNameValidated = true;
            });
          },
          decoration: const InputDecoration(
              hintText: 'Idetificación',
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
              return 'La identificación es obligatoria';
            } else if (_letras(value)) {
              return 'La identificación solo puede contener números';
            } else if (value.startsWith('0')) {
              return 'La identificación no puede iniciar con 0';
            } else if (validarEspaciosVacios(value) != null) {
              return 'No se pueden iniciar con espacios vacíos';
            } else if (value.length < 6 || value.length > 10) {
              return 'La identificación debe tener entre 6 y 10 dígitos';
            }
            return null;
          },
        ),
      ),
    ),
  ],
),


                            Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  controller: _nombreController,
                                  autovalidateMode: _isNameValidated
                                      ? AutovalidateMode.onUserInteraction
                                      : AutovalidateMode.disabled,
                                  onChanged: (value) {
                                    setState(() {
                                      _isNameValidated = true;
                                    });
                                  },
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
                            return 'El nombre es obligatorio';
                          } else if (!_contenedorDeNumeros(value)) {
                            return "El nombre solo puede tener letra";
                          } else if (validarEspaciosVacios(value) != null) {
                            return 'No se pueden iniciar con espacios vacíos';
                          } else if (value.length < 3 || value.length > 20) {
                            return 'El nombre debe de tener entre 3 y 20 caracteres';
                          }

                                    return null;
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  controller: _apellidoController,
                                  autovalidateMode: _isNameValidated
                                      ? AutovalidateMode.onUserInteraction
                                      : AutovalidateMode.disabled,
                                  onChanged: (value) {
                                    setState(() {
                                      _isNameValidated = true;
                                    });
                                  },
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
                          if (value!.isEmpty) {
                            return 'El apellido es obligatorio';
                          } else if (!_contenedorDeNumeros(value)) {
                            return "El apellido solo puede tener letra";
                          } else if (validarEspaciosVacios(value) != null) {
                            return 'No se pueden iniciar con espacios vacíos';
                          } else if (value.length < 3 || value.length > 20) {
                            return 'El apellido debe de tener entre 3 y 20 caracteres';
                          }

                          return null;
                        },
                      
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  controller: _telefonoController,
                                  autovalidateMode: _isNameValidated
                                      ? AutovalidateMode.onUserInteraction
                                      : AutovalidateMode.disabled,
                                  onChanged: (value) {
                                    setState(() {
                                      _isNameValidated = true;
                                    });
                                  },
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
                            return 'El teléfono es obligatorio';
                          } else if (_letras(value)) {
                            return 'El télefono solo puede tener números';
                          } else if (value.startsWith('0')) {
                            return 'El Numero telefonico no puede iniciar con 0';
                          } else if (validarEspaciosVacios(value) != null) {
                            return 'No se pueden iniciar con espacios vacíos';
                          } else if (value.length < 7 || value.length > 10) {
                            return 'El teléfono no puede iniciar con 0';
                          }
                          return null;
                        },
                                )),

                            Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  controller: _direccionController,
                                  autovalidateMode: _isNameValidated
                                      ? AutovalidateMode.onUserInteraction
                                      : AutovalidateMode.disabled,
                                  onChanged: (value) {
                                    setState(() {
                                      _isNameValidated = true;
                                    });
                                  },
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
                              return 'La dirección es obligatoria';
                            } else if (validarEspaciosVacios(value) != null) {
                              return 'No se pueden iniciar con espacios vacíos';
                            } else if (value.length < 4 || value.length > 50) {
                              return 'La dirección debe tener entre 4 y 50 caracteres';
                            }
                            return null;
                          },
                        )),
                                Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  controller: _emailController,
                                  autovalidateMode: _isNameValidated
                                      ? AutovalidateMode.onUserInteraction
                                      : AutovalidateMode.disabled,
                                  onChanged: (value) {
                                    setState(() {
                                      _isNameValidated = true;
                                    });
                                  },
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
                                      return "El correo electrónico es obligatorio";
                                    } else if (!regExp.hasMatch(value)) {
                                      return "El correo electrónico no tiene un formato válido";
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
                                            String identification =
                                                _identificationController.text;

                                            String typeidentification =
                                                _selectedTypeIdentification;

                                            if (_formKey.currentState!
                                                .validate()) {
                                              await customerProviderSingleton
                                                  .customerProvider
                                                  .editCustomer(
                                                      name,
                                                      lastName,
                                                      phone,
                                                      email,
                                                      address,
                                                      identification,
                                                      typeidentification);
                                            }

                                            await customerProvider
                                                .getCustomers();

                                            if (customerProviderSingleton
                                                        .customerProvider
                                                        .error ==
                                                    "" &&
                                                customerProviderSingleton
                                                        .customerProvider
                                                        .success !=
                                                    "") {
                                              AlertHelper.showMessageSnackBar(
                                                  context,
                                                  customerProviderSingleton
                                                      .customerProvider.success,
                                                  false);

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const CustomersScreen()));

                                              customerProviderSingleton
                                                  .customerProvider
                                                  .cleanSuccess();
                                            } else {
                                              AlertHelper.showMessageSnackBar(
                                                  context,
                                                  customerProviderSingleton
                                                      .customerProvider.error);

                                              customerProviderSingleton
                                                  .customerProvider
                                                  .cleanError();
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF47684e),
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
