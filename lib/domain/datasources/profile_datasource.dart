// Importamos el tipo de dato Profile (entidad de perfil) creado por nosotros
import 'package:colch_stat_app/domain/entities/profile.dart';

abstract class ProfileDataSource {
  
  Future<Profile> getProfile( String email, String password);

  //* Para más adelante
  Future<Profile> editProfile(name, lastName, phone, email);

  Future<void> changePassword(
      String currentPassword, String newPassword) ;
}