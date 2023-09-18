import 'package:colch_stat_app/presentation/screens/login_creen.dart';
import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  /// Instanciamos el proveedor para poder usar sus métodos

  // ignore: unused_field
  String _nombre = '';
  final _formKey = GlobalKey<FormState>();
  String _password = '';

  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
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
                        'Cambiar contraseña',
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
                      'Modifica tu contraseña aquí',
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
                                controller: _currentPassword,
                                decoration: InputDecoration(
                                    errorText: profileProvider
                                        .errores["messagePassword"],
                                    hintText: 'Contraseña actual',
                                    hintStyle: const TextStyle(
                                        fontWeight: FontWeight.w700),
                                    fillColor: const Color.fromARGB(
                                        255, 221, 216, 216),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0, style: BorderStyle.none),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0, style: BorderStyle.none),
                                    ),
                                    filled: true),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Ingrese su contraseña actual';
                                  }

                                  // if (profileProvider
                                  //         .errores["messagePassword"] !=
                                  //     "") {
                                  //   return
                                  // }
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
                                controller: _newPassword,
                                decoration: const InputDecoration(
                                    hintText: 'Nueva contraseña',
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
                                    return 'Ingrese su nueva contraseña';
                                  } else if (value.length < 6) {
                                    return "La contraseña es muy insegura agregue más de 5 caracteres";
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
                                          onPressed: () async {
                                            profileProvider.vaciarErrores();
                                            if (_formKey.currentState!
                                                .validate()) {
                                              String cp = _currentPassword.text;
                                              String np = _newPassword.text;

                                              await profileProvider
                                                  .changePassword(cp, np);

                                              print("Mensaje de error");
                                              print(profileProvider
                                                  .errores["messagePassword"]);

                                              if (profileProvider.errores[
                                                      "messagePassword"] !=
                                                  "") {
                                                setState(() {});

                                                // profileProvider.vaciarErrores();

                                                return;
                                              }

                                              profileProvider.vaciarErrores();

                                              setState(() {});

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
                                                      "Cambio de contraseña exitoso",
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
        navDrawerIndex: 4,
      ),
    );
  }
}
