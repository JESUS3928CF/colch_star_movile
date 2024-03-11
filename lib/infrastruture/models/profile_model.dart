import 'package:colch_stat_app/domain/entities/profile.dart';

/// Esto no lo necesitamos
// ProfileModel profileModelFromJson(String str) =>
//     ProfileModel.fromJson(json.decode(str));

// String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  final int id;
  final String name;
  final String lastName;
  final bool state;
  final List<String> permissions;
  final String token;

  ProfileModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.state,
    required this.permissions,
    required this.token,
  });

  // este método lo que hará es recibir un JSON y moldearlo a como nosotros lo usamos en nuestra app

  // Ejemplo de utilidad, digamos que más adelante cambia la forma en que la api nos envía los datos, no tenemos que cambiar esa estructura en todos los lugares donde se usa esa información, solo aquí en en este método y ya
  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
      id: json["id_usuario"],
      name: json["nombre"],
      lastName: json["apellido"],
      state: json["rol"]["estado"],
      permissions: json["permisos"],
      token : json["token"],
  );

  //* Esto es para estructurar nuestra entidad de forma que nuestra api la reciba en la forma que se espera
  static Map<String, dynamic> toJsonLogin(String email, String password) => {
        "email": email,
        "contrasena": password,
      };

  /// Crear un método para retornar ese usuario usamos la entidad
  Profile toProfileEntity() => Profile(
        id: id,
        name: name,
        lastName: lastName,
        state: state,
        permissions: permissions,
        token: token,
      );
}
