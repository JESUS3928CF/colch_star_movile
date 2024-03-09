import 'package:colch_stat_app/domain/entities/profile.dart';

/// Esto no lo necesitamos
// ProfileModel profileModelFromJson(String str) =>
//     ProfileModel.fromJson(json.decode(str));

// String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  final int id;
  final String name;
  final String lastName;
  final String phone;
  final String email;
  final String password;
  final bool state;
  final String rolName;

  ProfileModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.password,
    required this.state,
    required this.rolName,
  });

  // este método lo que hará es recibir un JSON y moldearlo a como nosotros lo usamos en nuestra app

  // Ejemplo de utilidad, digamos que más adelante cambia la forma en que la api nos envía los datos, no tenemos que cambiar esa estructura en todos los lugares donde se usa esa información, solo aquí en en este método y ya
  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id_usuario"],
        name: json["nombre"],
        lastName: json["apellido"],
        phone: json["telefono"],
        email: json["email"],
        password: json["contrasena"],
        state: json["estado"],
        rolName: json["rol"],
      );

  //* Esto es para estructurar nuestra entidad de forma que nuestra api la reciba en la forma que se espera
  Map<String, dynamic> toJson() => {
        "id_usuario": id,
        "nombre": name,
        "apellido": lastName,
        "telefono": phone,
        "email": email,
        "contrasena": password,
        "estado": state,
        "rol": rolName,
      };

  /// Crear un método para retornar ese usuario usamos la entidad
  Profile toProfileEntity() => Profile(
      id: id,
      name: name,
      lastName: lastName,
      phone: phone,
      email: email,
      password: password,
      state: state,
      rolName: rolName);
}
