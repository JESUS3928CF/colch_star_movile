import 'package:colch_stat_app/domain/entities/profile.dart';

abstract class ProfileRepository {  

  Future<Profile> getProfile(String email, String password);
}