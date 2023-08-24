import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class CustomersCreate extends StatefulWidget {
  const CustomersCreate({super.key});

  @override
  State<CustomersCreate> createState() => _CustomersCreateState();
}

class _CustomersCreateState extends State<CustomersCreate> {
  String _nombre = '';
  final _formKey = GlobalKey<FormState>();
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), child: AppBarColch()),
      body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.only(top: 40, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const Center(
                        child: Text(
                          'Agregar Cliente',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                          child: Text('!Agregar nuevo cliente de colch star!')),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: 'Nombre',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w600),
                                      fillColor:
                                          Color.fromARGB(255, 209, 203, 203),
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
                                      hintText: 'Apellidos',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w600),
                                      fillColor:
                                          Color.fromARGB(255, 209, 203, 203),
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
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w600),
                                      fillColor:
                                          Color.fromARGB(255, 209, 203, 203),
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
                          decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle:
                                  const TextStyle(fontWeight: FontWeight.w600),
                              fillColor: Color.fromARGB(255, 168, 235, 168),
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
                                  decoration: const InputDecoration(
                                      hintText: 'Direccion',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w600),
                                      fillColor:
                                          Color.fromARGB(255, 209, 203, 203),
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
                                      return 'Por favor ingrese su Direccion';
                                    }
                                    return null;
                                  },
                                  
                                )),
                          ],
                        ))
                  ],
                ))),
        drawer: SideMenu(navDrawerIndex: 2));
  }
}
    
  
