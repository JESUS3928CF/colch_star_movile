class Order {
  /// sus atributos - estos tienes que ser de el mismo tipo que los de la DB
  final int id;
  final double totalPrice;
  final String address;
  final DateTime creationDate;
  final DateTime deliverDate;
  final String orderStatus;
  final String clientName;

  Order(
      {required this.id,
      required this.totalPrice,
      required this.address,
      required this.creationDate,
      required this.deliverDate,
      required this.orderStatus,
      required this.clientName});
    
  Order copyWith({
    int? id,
    double? totalPrice,
    String? address,
    DateTime? creationDate,
    DateTime? deliverDate,
    String? orderStatus,
    String? clientName,

  }) {
    return Order(
      id: id ?? this.id,
      totalPrice: totalPrice ?? this.totalPrice,
      address: address ?? this.address,
      creationDate: creationDate ?? this.creationDate,
      deliverDate: deliverDate ?? this.deliverDate,
      orderStatus: orderStatus ?? this.orderStatus,
      clientName: clientName ?? this.clientName,
    );
  }
}
