// import 'dart:html';

import 'dart:convert';

import 'package:colch_stat_app/domain/entities/profile.dart';
import 'package:colch_stat_app/infrastruture/models/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class ProfileProvider extends ChangeNotifier {
  final _dio = Dio(BaseOptions());

  /// Si vas a manejar varios elementos de el mismo tipo aca harías un atributo de tipo array
  List<Profile> profileList = []; //* esto es una lista de entidades de usuarios
  Map<String, dynamic> profile = {};

  //! Esta petición no se una para el perfil pero es un ejemplo de como traer varios registros
  Future<void> getUsers() async {
    final response = await _dio.get("http://localhost:3000/api/usuarios");

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final List<Profile> newProfile = data
          .map((profile) => ProfileModel.fromJson(profile).toProfileEntity())
          .toList();

      profileList
          .clear(); // Limpia la lista existente antes de agregar los nuevos perfiles.
      profileList.addAll(newProfile);

      notifyListeners();
    } else {
      // Manejar el error aquí si es necesario
    }
  }

  Future<void> getProfile(email, password) async {
    // URL de la API a la que deseas enviar la solicitud POST
    const url = 'http://localhost:3000/api/usuarios/login';

    // Datos que deseas enviar en el cuerpo de la solicitud
    final data = {
      'email': email,
      'contrasena': password,
    }; 

    // Codifica los datos en formato JSON
    final jsonData = jsonEncode(data);

    try {
      // Realiza la solicitud POST
      final response = await _dio.post(url, data: jsonData);

      // Verifica el código de estado de la respuesta
      if (response.statusCode == 200) {
        // La solicitud POST fue exitosa, puedes manejar la respuesta aquí

        profile = response.data;
        notifyListeners();
      } else {
        // La solicitud POST falló con un código de estado diferente de 200
        throw Exception(
            "La solicitud POST falló con el código de estado ${response.statusCode}");
      }
    } catch (error) {
      // Manejo de errores
      print("Error en la solicitud: $error");
      // Puedes mostrar un mensaje de error al usuario o tomar otras medidas apropiadas aquí
    }
  }
}
