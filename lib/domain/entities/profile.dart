class Profile {
  /// sus atributos - estos tienes que ser de el mismo tipo que los de la DB
  final int id;
  final String name;
  final String lastName;
  final bool state;
  final List<String> permissions; 
  final String token;

  /// Creamos el constructor
  Profile({
    required this.id,
    required this.name,
    required this.lastName,
    required this.state,
    required this.permissions,
    required this.token,
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
    List<String>? permissions,
    String? token,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      state: state ?? this.state,
      permissions: permissions ?? this.permissions,
      token : token ?? this.token,
    );
  }
}
