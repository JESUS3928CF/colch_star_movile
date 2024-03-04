import 'dart:convert';

import 'package:colch_stat_app/domain/entities/profile.dart';
import 'package:colch_stat_app/config/helpers/config.dart';
import 'package:colch_stat_app/infrastruture/models/profile_model.dart';
import 'package:colch_stat_app/infrastruture/repositories/profile_repository_imp.dart';
import 'package:dio/dio.dart';
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
    phone: '',
    email: '',
    password: '',
    state: false,
    rolName: '',
    errorMessageEmail: 'El email ingresado no es válido.',
    errorMessagePassword: 'La contraseña ingresada no es válida.',
  );

  ProfileProvider({required this.profileRepository}); 

  Future<void> getProfile(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    final userLogin = await profileRepository.getProfile(email, password);
    _profile = userLogin; 
    notifyListeners(); // Notificar a los oyentes (listeners) sobre el cambio en el perfil
  }

  

  //!- ver esto desde donde se hace - Propiedad a llenar cuando alguien intenta loguearse pero comete errores
  Map<String, dynamic> errores = {"messageEmail": "", "messagePassword": ""};

  // void vaciarErrores() {
  //   errores = {"messageEmail": "", "messagePassword": ""};
  //   notifyListeners();
  // }

  void vaciarErrores() {
    // Modificar solo las propiedades de errores
    _profile = _profile.copyWith(
      errorMessageEmail: "",
      errorMessagePassword: "",
    );

    notifyListeners();
  }


  void singOff() {
    _profile = Profile(
      id: 0,
      name: '',
      lastName: '',
      phone: '',
      email: '',
      password: '',
      state: false,
      rolName: '',
    );
    notifyListeners();
  }

  


  // Método getter para acceder al perfil
  Profile get profile => _profile;



  // Método para actualizar el perfil
  void editProfile(name, lastName, phone, email) {
    // _profile = newProfile;
    notifyListeners(); // Notificar a los widgets que el estado ha cambiado
  }
  void changePassword (cp, np) {
     notifyListeners(); 
  }

}
