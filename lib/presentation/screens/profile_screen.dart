import 'package:colch_stat_app/presentation/providers/profile_provider.dart';
import 'package:colch_stat_app/presentation/screens/login_creen.dart';
import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';

var profileProfile = ProfileProvider();

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

void initState() {
  // Llena los controladores con los datos iniciales del perfil solo una vez
  print("Llenar perfil");
  print(profileProfile.profile);
}

class _ProfileScreenState extends State<ProfileScreen> {
  initState();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreController =
      TextEditingController(text: profileProvider.profile["name"]);
  final TextEditingController _apellidoController =
      TextEditingController(text: profileProvider.profile["lastName"]);
  final TextEditingController _telefonoController =
      TextEditingController(text: profileProvider.profile["phone"]);
  final TextEditingController _emailController =
      TextEditingController(text: profileProvider.profile["email"]);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable;

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
                      '!Modifica tu información aquí!',
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
                                /// Usando el provider hacer esto por cada uno de los inputs
                                controller: _nombreController,
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
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: TextFormField(
                                controller: _apellidoController,
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
                                controller: _telefonoController,
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
                                controller: _emailController,
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
                                            String name =
                                                _nombreController.text;
                                            String lastName =
                                                _apellidoController.text;
                                            String phone =
                                                _telefonoController.text;
                                            String email =
                                                _emailController.text;
                                            if (_formKey.currentState!
                                                .validate()) {
                                              profileProvider.editProfile(
                                                  name, lastName, phone, email);
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
                                                      "Usuario editado correctamente",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255)),
                                                    )
                                                  ],
                                                ),
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
