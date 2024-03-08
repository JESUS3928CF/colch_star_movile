class Order {
  /// sus atributos - estos tienes que ser de el mismo tipo que los de la DB
  final int id;
  late final String product;
  late final int amountProduct;
  late final String total;
  late final DateTime time;
  late final String description;
  final bool state;
  late final int fkSale;

  Order(
      {required this.id,
      required this.product,
      required this.amountProduct,
      required this.total,
      required this.time,
      required this.description,
      required this.state,
      required this.fkSale});
    
  Order copyWith({
    int? id,
    String? product,
    int? amountProduct,
    String? total,
    DateTime? time,
    String? description,
    bool? state,
    int? fkSale,

  }) {
    return Order(
      id: id ?? this.id,
      product: product ?? this.product,
      amountProduct: amountProduct ?? this.amountProduct,
      total: total ?? this.total,
      time: time ?? this.time,
      description: description ?? this.description,
      state: state ?? this.state,
      fkSale: fkSale ?? this.fkSale
    );
  }
}
