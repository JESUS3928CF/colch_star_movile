class Customer {
  /// sus atributos - estos tienes que ser de el mismo tipo que los de la DB
  final int id;
  late final String name;
  late final String lastName;
  late final String phone;
  late final String email;
  late final String address;
  final bool state;

  Customer({required this.id, required this.name, required this.lastName, required this.phone, required this.email, required this.address, required this.state});

  
}