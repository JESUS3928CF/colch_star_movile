import 'package:colch_stat_app/config/constants/enviroment.dart';
import 'package:colch_stat_app/domain/datasources/profile_datasource.dart';
import 'package:colch_stat_app/domain/entities/profile.dart';
import 'package:colch_stat_app/infrastruture/errors/custom_error.dart';
import 'package:colch_stat_app/infrastruture/models/profile_model.dart';
import 'package:dio/dio.dart';

// con el tipo de dataSource api nos encargaremos de funciones crud
class ApiProfileDataSourceImpl implements ProfileDataSource {
  
  //* Para hacer las peticiones
  final _dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl
  ));

  @override
  Future<Profile> getProfile(email, password) async {
    try {

      final data = ProfileModel.toJsonLogin(email, password);

      print(data);
      final response = await _dio.post("/usuarios/login", data: data);
      
      final user = ProfileModel.fromJson(response.data["usuario"]).toProfileEntity();

      return user;

    } on DioException catch (e) {
      print(e);
      
      throw UnimplementedError();
    } catch (e) {
      throw Exception();
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
