import 'package:colch_stat_app/domain/entities/profile.dart';
import 'package:colch_stat_app/infrastruture/datasources/local_profile_datasource_imp.dart';
import 'package:colch_stat_app/infrastruture/errors/custom_error.dart';
import 'package:colch_stat_app/infrastruture/repositories/profile_repository_imp.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  // todo: por aca instanciar el repository que se usara
  final ProfileRepositoryImpl profileRepository;

  //* Esta es propiedad privada que solo sera modificada dentro de esta clase para contener la información del perfil
  Profile _profile = Profile(
    id: 0,
    name: '',
    lastName: '',
    state: false,
    permissions: [],
  );

  //!- ver esto desde donde se hace - Propiedad a llenar cuando alguien intenta loguearse pero comete errores
  String _error = "";

  ProfileProvider({required this.profileRepository});

  Future<void> getProfile(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final userLogin = await profileRepository.getProfile(email, password);
      
      if(userLogin.state == false) {
        _error = "Este usuario se encuentra deshabilitado";
      } else if(!userLogin.permissions.contains("clientes") || !userLogin.permissions.contains("ordenes")) {
        _error = "Este usuario no cuenta con los permisos necesarios";
      }
      else {

        _profile = userLogin;
      }
    } on CustomError catch (e) {
      _error = e.message;
    } catch (e) {
      _error = "Error no controlado";
    }

    notifyListeners(); // Notificar a los oyentes (listeners) sobre el cambio en el perfil
  }

  void vaciarError() {
    _error = "";

    notifyListeners();
  }

  void singOff() {
    _profile = Profile(
      id: 0,
      name: '',
      lastName: '',
      state: false,
      permissions: [],
    );
    notifyListeners();
  }

  // Método getter para acceder al perfil
  Profile get profile => _profile;

  String get error => _error;

  // Método para actualizar el perfil
  void editProfile(name, lastName, phone, email) {
    // _profile = newProfile;
    notifyListeners(); // Notificar a los widgets que el estado ha cambiado
  }

  void changePassword(cp, np) {
    notifyListeners();
  }
}

/// Instanciar el provider una sola ves en toda la app
class ProfileProviderSingleton {
  /// Creación de una única instancia del repositorio que se usara.
  static final ProfileRepositoryImpl profileRepository =
      ProfileRepositoryImpl(profileDataSource: LocalProfileDataSourceImpl());

  /// Declaración de la única instancia de CustomerProviderSingleton como privada y estática.
  static final ProfileProviderSingleton _instance =
      ProfileProviderSingleton._internal();

  /// Constructor de fábrica privado para crear o devolver la instancia única de CustomerProviderSingleton.
  factory ProfileProviderSingleton() {
    return _instance;
  }

  /// Constructor privado interno para evitar la creación de instancias desde fuera de la clase.
  ProfileProviderSingleton._internal();

  /// Método estático para obtener la instancia única de CustomerProviderSingleton.
  static ProfileProviderSingleton get instance => _instance;

  /// Propiedad para almacenar la instancia de CustomerProvider.
  final ProfileProvider _profileProvider =
      ProfileProvider(profileRepository: profileRepository);

  /// Método getter para obtener la instancia de CustomerProvider.
  ProfileProvider get profileProvider => _profileProvider;
}

/// 1)  Instanciar el CustomerProviderSingleton y donde lo necesitemos lo importamos
final profileProviderSingleton = ProfileProviderSingleton.instance;
