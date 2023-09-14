
class Sales {
  /// sus atributos - estos tienes que ser de el mismo tipo que los de la DB
  final int id;
  final String products;
  final int amountProducts;
  final double price;
  final DateTime deliverDate;
  final String description;
  final bool state;

  Sales({required this.id, required this.products,
   required this.amountProducts, required this.price, 
   required this.deliverDate, required this.description,
    required this.state});
}