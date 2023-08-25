import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _nombre = '';
  final _formKey = GlobalKey<FormState>();
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), child: AppBarColch()),
      body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.only(top: 0, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: const Center(
                      child: Text(
                        'Editar perfil',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 7),
                    child: Center(
                        child: Text(
                      '!Modifica tu informacion aqui!',
                      style: TextStyle(fontSize: 17),
                    )),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'Nombre',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w700),
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
                                onSaved: (value) {
                                  setState(() {
                                    _nombre = value.toString();
                                  });
                                },
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'Apellido',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w700),
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
                                decoration: const InputDecoration(
                                    hintText: 'Telefono',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w700),
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
                                    return 'Por favor ingrese su Telefono';
                                  }
                                  return null;
                                },
                              )),

                          Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'Email',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w700),
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
                                obscureText: true,
                                onChanged: (value) {
                                  setState(() {
                                    _password = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                    hintText: 'Contraseña',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w700),
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
                                      r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{10,20}$';
                                  RegExp regExp = RegExp(pattern);
                                  if (value!.isEmpty) {
                                    return "La contraseña es necesaria";
                                  } else if (!regExp.hasMatch(value)) {
                                    return "La contraseña debe tener al menos 10 y maximo 20 caracteres , 1 letra mayúscula, 1 minúscula y 1 número. Además puede contener caracteres especiales.";
                                  } else {
                                    return null;
                                  }
                                },
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                    hintText: 'Confirmar contraseña',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w700),
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
                                    return 'Please enter some text';
                                  }
                                  if (value != _password) {
                                    return 'Las contraseñas no coinciden';
                                  }
                                  return null;
                                },
                              )),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Center(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 45,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
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
                                                      "Usuario registrado correctamente",
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
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .green, // background (button) color
                                            foregroundColor: Colors
                                                .white, // foreground (text) color
                                          ),
                                          child: const Text('Guardar Cambios')),
                                    ),
                                  )),
                            ],
                          ),
                          // Añade un espacio entre los botones
                        ],
                      ))
                ],
              ))),
      drawer: SideMenu(
        navDrawerIndex: 3,
      ),
    );
  }
}
