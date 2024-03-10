import 'package:colch_stat_app/domain/datasources/profile_datasource.dart';
import 'package:colch_stat_app/domain/entities/profile.dart';
import 'package:colch_stat_app/infrastruture/errors/custom_error.dart';
import 'package:colch_stat_app/infrastruture/models/profile_model.dart';
import 'package:colch_stat_app/shared/data/local_usuario.dart';

// Con este dataSources solo nos encargaremos de poder listar
class LocalProfileDataSourceImpl implements ProfileDataSource {
  @override
  Future<Profile> getProfile(String email, String password) async {
    // Simulando una consulta a una base de datos local o almacenamiento local
    await Future.delayed(const Duration(seconds: 2));
    
    // En este ejemplo, estamos utilizando el mapa de usuario importado
    if (email == usuario["email"] && password == usuario["contrasena"]) {
      // Si las credenciales coinciden, devolvemos el perfil del usuario
      return ProfileModel.fromJson(usuario).toProfileEntity();
    } else {
      // Si las credenciales no coinciden, lanzamos una excepción con un mensaje de error
      throw CustomError("Usuario o contraseña sin incorrectas");
    }
  }

  @override
  Future<void> changePassword(String currentPassword, String newPassword) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Profile> editProfile(name, lastName, phone, email) {
    // TODO: implement editProfile
    throw UnimplementedError();
  }
}
