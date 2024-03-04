import 'package:colch_stat_app/domain/datasources/profile_datasource.dart';
import 'package:colch_stat_app/domain/entities/profile.dart';
import 'package:colch_stat_app/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {

  //- llamar el data source que usaremos
  final ProfileDataSource profileDataSource;

  ProfileRepositoryImpl({ required this.profileDataSource});

  @override
  Future<Profile> getProfile(String email, String password) {
    return profileDataSource.getProfile(email, password);
  }
  
}