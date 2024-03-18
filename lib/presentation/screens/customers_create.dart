import 'package:colch_stat_app/infrastruture/alerts/alertHelper.dart';
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

bool _isNameValidated = false;

String? validarEspaciosVacios(String value) {
  List<String> valueList = value.split(' ');

  if (valueList.every((letra) => letra == ' ')) {
    return 'No se pueden espacios vacíos';
  } else {
    return null;
  }
}


bool   _espacios(String value) {

  if (value.contains(" ")) {
    return true;
  } else {
    return false;
  }
}

bool _contenedorDeNumeros(String value) {
  String letrasConEspacios = r'^[a-zA-ZáéíóúÁÉÍÓÚ]+$'; // Incluye letras con tildes
  final RegExp regex = RegExp(letrasConEspacios);
  return regex.hasMatch(value);
}


bool _letras(String value) {
  if (value.isNotEmpty && !RegExp(r'^\d*\.?\d*$').hasMatch(value)) {
    return true;
  }
  return false;
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
           Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    SizedBox(
      width: MediaQuery.of(context).size.width * 0.2, // Ancho deseado para el DropdownButtonFormField
      child: Padding(

        padding: const EdgeInsets.only(top: 20 ),
        child: DropdownButtonFormField<String>(
                          // isExpanded: true, 

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
    ),
    Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10),
        child: TextFormField(
          controller: _identification,
          autovalidateMode: _isNameValidated
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          onChanged: (value) {
            setState(() {
              _isNameValidated = true;
            });
          },
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
              return 'La identificación es obligatoria';
            }  if (_letras(value)) {
              return 'La identificación solo puede contener números';
            }  else if (value.startsWith('0')) {
              return 'La identificación no puede iniciar con 0';
            }  else if  (validarEspaciosVacios(value) != null) {
              return 'No se pueden iniciar con espacios vacíos';
            }  else if (value.length < 6 || value.length > 10) {
              return 'La identificación debe tener entre 6 y 10 dígitos';
            }
            
             else if (_espacios(value) ){
              return 'No se permiten espacios en blanco';
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
                        controller: _nameController,
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
                            return 'El nombre es obligatorio';
                          } else  if (!_contenedorDeNumeros(value)) {
                            return "El nombre solo puede tener letra";
                          } else if (validarEspaciosVacios(value) != null) {
                            return 'No se pueden iniciar con espacios vacíos';
                          } else if (value.length < 3 || value.length > 20) {
                            return 'El nombre debe de tener entre 3 y 20 caracteres';
                          }

                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _lastNameController,
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
                            return 'El apellido es obligatorio';
                          } else  if (!_contenedorDeNumeros(value)) {
                            return "El apellido solo puede tener letra";
                          } else if (validarEspaciosVacios(value) != null) {
                            return 'No se pueden iniciar con espacios vacíos';
                          } else if (value.length < 3 || value.length > 20) {
                            return 'El apellido debe de tener entre 3 y 20 caracteres';
                          }

                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _phoneController,
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
                            return 'El teléfono es obligatorio';
                          }  else if (_letras(value)) {
                            return 'El télefono solo puede tener números';
                          } else  if (value.startsWith('0')) {
                            return 'El télefono no puede iniciar con 0';
                          } else if (validarEspaciosVacios(value) != null) {
                            return 'No se pueden iniciar con espacios vacíos';


                            
                          }  
            else if (_espacios(value) ){
              return 'No se permiten espacios en blanco';
            }
                          
                          
                         else if (value.length < 7 || value.length > 10) {
                            return 'El teléfono no puede iniciar con 0';
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          controller: _addressController,
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
                              return 'La dirección es obligatoria';
                            } else  if (validarEspaciosVacios(value) != null) {
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
                              return "El correo electrónico es obligatorio";
                            } else if (!regExp.hasMatch(value)) {
                              return "El correo electrónico no tiene un formato válido";
                            }else  {
                              return null;
                            }
                          },
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
                        const SizedBox(
                          width: 20,
                        ),
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
                                  final identification = _identification.text;
                                  final typeidentification =
                                      _selectedTypeIdentification;

                                  // Llamar a la función para crear el cliente
                                  await customerProviderSingleton
                                      .customerProvider
                                      .createCustomer(
                                          name,
                                          lastName,
                                          phone,
                                          email,
                                          address,
                                          identification,
                                          typeidentification);
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

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CustomersScreen()));
                                    
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
