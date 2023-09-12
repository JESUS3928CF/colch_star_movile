class Customer {
  /// sus atributos - estos tienes que ser de el mismo tipo que los de la DB
  final int id;
  final String name;
  final String lastName;
  final String phone;
  final String email;
  final String address;
  final bool state;

  Customer({required this.id, required this.name, required this.lastName, required this.phone, required this.email, required this.address, required this.state});

  
}