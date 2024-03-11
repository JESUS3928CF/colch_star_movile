class Order {
  /// sus atributos - estos tienes que ser de el mismo tipo que los de la DB
  final int id;
  late final double precio_total;
  late final String direccion;
  late final DateTime fecha_creacion;
  late final DateTime fecha_entrega;
  late final String estado_de_orden;
  late final int fk_cliente;

  Order(
      {required this.id,
      required this.precio_total,
      required this.direccion,
      required this.fecha_creacion,
      required this.fecha_entrega,
      required this.estado_de_orden,
      required this.fk_cliente});
    
  Order copyWith({
    int? id,
    double? precio_total,
    String? direccion,
    DateTime? fecha_creacion,
    DateTime? fecha_entrega,
    String? estado_de_orden,
    int? fk_cliente,

  }) {
    return Order(
      id: id ?? this.id,
      precio_total: precio_total ?? this.precio_total,
      direccion: direccion ?? this.direccion,
      fecha_creacion: fecha_creacion ?? this.fecha_creacion,
      fecha_entrega: fecha_entrega ?? this.fecha_entrega,
      estado_de_orden: estado_de_orden ?? this.estado_de_orden,
      fk_cliente: fk_cliente ?? this.fk_cliente,
    );
  }
}
