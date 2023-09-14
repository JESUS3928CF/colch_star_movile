import 'dart:ffi';

class Sales {
  /// sus atributos - estos tienes que ser de el mismo tipo que los de la DB
  final int id;
  late final String product;
  late final int amountproduct;
  late final String totalamount;
  late final String time;
  late final String description;
  final bool state;
  late final int fk_cliente;

 

  Sales({required this.id, required this.product, required this.amountproduct,  required this.totalamount, required this.time, required this.description, required this.state, required this.fk_cliente});

  
}