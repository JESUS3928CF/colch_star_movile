import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class SalesCreate extends StatefulWidget {
  const SalesCreate({super.key});

  @override
  State<SalesCreate> createState() => _SalesCreateState();
}

class _SalesCreateState extends State<SalesCreate> {

   String _nombre = '';
  final _formKey = GlobalKey<FormState>();
  String _password = '';

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
                          'Agregar Venta',
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
                          child: Text('!Agregar una nueva venta a colch star!',
                          style: TextStyle(
                            fontSize: 17
                          ),)),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: 'Producto',
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
                                      return 'Por favor el nombre del producto';
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
                                      hintText: 'Cantidad',
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
                                      return 'Por favor digite la cantidad';
                                    }
                                    return null;
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: 'Precio',
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
                                      return 'Por favor ingrese el precio';
                                    }
                                    return null;
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: 'Fecha de entrega ',
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
                                      return "La fecha es necesario";                                    
                                    }
                                    return null;
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: 'Descripcion',
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
                                      return 'Por favor ingrese la descripcion del producto';
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
                                                      "Venta registrada correctamente",
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
                                          child: const Text('Agregar')),
                                    )),
                                    SizedBox( width: 20,),
                                SizedBox(
                                  width: 100,
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Lógica para cancelar aquí
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .red, // Puedes cambiar el color según tus preferencias
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text('Cancelar'),
                                  ),
                                ),

                                SizedBox( width: 30,),
                                SizedBox(
                                  width: 100,
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: (){

                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                    ),

                                    child: const Text('Cliente'),
                                  ) ,)
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