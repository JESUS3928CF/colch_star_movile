
import 'package:colch_stat_app/presentation/screens/sales_screen.dart';
import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class SalesEdit extends StatefulWidget {
  const SalesEdit({super.key});

  @override
  State<SalesEdit> createState() => _SalesEditState();
}

class _SalesEditState extends State<SalesEdit> {
  final _formKey = GlobalKey<FormState>();

  // final TextEditingController _productController =
  //     TextEditingController(text: saleProvider.sale["product"]);

  // final TextEditingController _amountProductController =
  //     TextEditingController(text: saleProvider.sale["amountProduct"].);

  // final TextEditingController _montTotalController =
  //     TextEditingController(text: saleProvider.sale["montTotal"]);

  // final TextEditingController _timeController =
  //     TextEditingController(text: saleProvider.sale["time"]);

  // final TextEditingController _descriptionController =
  //     TextEditingController(text: saleProvider.sale["description"]);

  // final TextEditingController _fksaleController =
  //   TextEditingController(text: saleProvider.sale["fksale"]);
    final TextEditingController _productController =
      TextEditingController(text: saleProvider.sale["product"] ?? "");

  final TextEditingController _amountProductController =
      TextEditingController(text: saleProvider.sale["amountProduct"].toString());

  final TextEditingController _montTotalController =
      TextEditingController(text: saleProvider.sale["montTotal"].toString());

  final TextEditingController _timeController =
      TextEditingController(text: saleProvider.sale["time"]?.toString() ?? "");

  final TextEditingController _descriptionController =
      TextEditingController(text: saleProvider.sale["description"] ?? "");

  final TextEditingController _fksaleController =
      TextEditingController(text: saleProvider.sale["fksale"].toString());

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
                          'Editar Venta',
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
                        '!Editar venta de colch star!',
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
                                  controller: _productController,
                                  decoration: const InputDecoration(
                                      hintText: 'producto',
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
                                  controller: _amountProductController,
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
                                      return 'Por favor digite su apellido';
                                    }
                                    return null;
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  controller: _montTotalController,
                                  decoration: const InputDecoration(
                                      hintText: 'Precio Total',
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
                                  controller: _timeController,
                                  decoration: const InputDecoration(
                                      hintText: 'Time',
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
                                  controller: _descriptionController,
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
                                      return 'Por favor ingrese su Dirección';
                                    }
                                    return null;
                                  },
                                )),
                                Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  controller: _fksaleController,
                                  decoration: const InputDecoration(
                                      hintText: 'fk_cliente',
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
                                            String product =
                                                _productController.text;
                                            String amountProduct =
                                                _amountProductController.text;
                                            String montTotal =
                                                _montTotalController.text;
                                            String time =
                                                _timeController.text;
                                            String description =
                                                _descriptionController.text;
                                            String fksale =
                                              _fksaleController.text;

                                            if (_formKey.currentState!
                                                .validate()) {
                                              saleProvider.editSale(
                                                  product,
                                                  amountProduct,
                                                  montTotal,
                                                  time,
                                                  description,
                                                  fksale);
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
                                                      "Venta editada correctamente",
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

                                            await saleProvider
                                                .getSales();

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SalesScreen()));
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
                                                  const SalesScreen()));
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
