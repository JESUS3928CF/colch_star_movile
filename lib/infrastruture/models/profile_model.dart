import 'package:colch_stat_app/domain/entities/profile.dart';

/// Esto no lo necesitamos
// ProfileModel profileModelFromJson(String str) =>
//     ProfileModel.fromJson(json.decode(str));

// String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  final int idUsuario;
  final String nombre;
  final String apellido;
  final String telefono;
  final String email;
  final String contrasena;
  final bool estado;
  final int fkRol;
  final Role role;

  ProfileModel({
    required this.idUsuario,
    required this.nombre,
    required this.apellido,
    required this.telefono,
    required this.email,
    required this.contrasena,
    required this.estado,
    required this.fkRol,
    required this.role,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        idUsuario: json["id_usuario"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        telefono: json["telefono"],
        email: json["email"],
        contrasena: json["contrasena"],
        estado: json["estado"],
        fkRol: json["fk_rol"],
        role: Role.fromJson(json["role"]),
      );

  Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario,
        "nombre": nombre,
        "apellido": apellido,
        "telefono": telefono,
        "email": email,
        "contrasena": contrasena,
        "estado": estado,
        "fk_rol": fkRol,
        "role": role.toJson(),
      };


    /// Crear un método para retornar ese usuario usamos la entidad
    Profile toProfileEntity () => Profile(id: idUsuario, name: nombre, lastName: apellido, phone: telefono, email: email, password: contrasena, state: estado, rolName: role.nombre );
    
}

class Role {
  final String nombre;

  Role({
    required this.nombre,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
      };
}
