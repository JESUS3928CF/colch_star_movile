class Profile {
  /// sus atributos - estos tienes que ser de el mismo tipo que los de la DB
  final int id;
  final String name;
  final String lastName;
  final String phone;
  final String email;
  final String password;
  final bool state;
  final String rolName;

  /// Creamos el constructor
   Profile({
    required this.id,
    required this.name,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.password,
    required this.state,
    required this.rolName,
  });


  // Método copyWith es como los setter algo asi 
  Profile copyWith({
    int? id,
    String? name,
    String? lastName,
    String? phone,
    String? email,
    String? password,
    bool? state,
    String? rolName,
    String? errorMessageEmail,
    String? errorMessagePassword,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      state: state ?? this.state,
      rolName: rolName ?? this.rolName,
    );
  }
  
}