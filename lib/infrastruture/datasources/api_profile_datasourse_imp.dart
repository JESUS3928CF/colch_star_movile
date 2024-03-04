import 'package:colch_stat_app/domain/datasources/profile_datasource.dart';
import 'package:colch_stat_app/domain/entities/profile.dart';
import 'package:dio/dio.dart';

// con el tipo de dataSource api nos encargaremos de funciones crud
class ApiProfileDataSourceImpl implements ProfileDataSource {
  
  //* Para hacer las peticiones
  // final _dio = Dio(BaseOptions());

  @override
  Future<Profile> getProfile(email, password) {
    // TODO: implement getProfile
    throw UnimplementedError();
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
