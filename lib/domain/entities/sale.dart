class Sale {
  /// sus atributos - estos tienes que ser de el mismo tipo que los de la DB
  final int id;
  late final String product;
  late final int amountProduct;
  late final String montTotal;
  late final DateTime time;
  late final String description;
  final bool state;
  late final int fksale;

  Sale({required this.id, required this.product, required this.amountProduct, required this.montTotal, required this.time, required this.description, required this.state,required this.fksale});

  
}