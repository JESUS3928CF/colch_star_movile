class Customer {
  /// sus atributos - estos tienes que ser de el mismo tipo que los de la DB
  final int id;
  late final String name;
  late final String lastName;
  late final String phone;
  late final String email;
  late final String address;
  late final String identification;
  late final String typeidentification;
  final bool state;

  Customer({required this.id, required this.name, 
  required this.lastName, required this.phone, 
  required this.email, required this.address,
  required this. identification, required this. typeidentification,
  required this.state});

  Customer copyWith({
    int? id,
    String? name,
    String? lastName,
    String? phone,
    String? email,
    String? address,
    String? identification,
    String? typeidentification,
    bool? state,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      identification: identification?? this.identification,
      typeidentification: typeidentification?? this.typeidentification,
      state: state ?? this.state,
    );
  }
  
}