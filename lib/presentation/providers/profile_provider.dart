import 'dart:convert';

import 'package:colch_stat_app/domain/entities/profile.dart';
import 'package:colch_stat_app/domain/helpers/config.dart';
import 'package:colch_stat_app/infrastruture/models/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class ProfileProvider extends ChangeNotifier {
  final _dio = Dio(BaseOptions());

  //! - Si vas a manejar varios elementos de el mismo tipo aca harías un atributo de tipo array
  List<Profile> profileList = []; //* esto es una lista de entidades de usuarios

  //! - Esto se remplaza por que eso se estruptura con el mapper
  /// Propiedad a llenar si alguien se loguea
  Map<dynamic, dynamic> profile = {
    "id": "",
    "name": "",
    "lastName": "",
    "phone": "",
    "email": "",
    "password": "",
    "state": "",
    "rolName": ""
  };

  //!- ver esto desde donde se hace - Propiedad a llenar alguien intenta loguearse pero comete errores
  Map<String, dynamic> errores = {"messageEmail": "", "messagePassword": ""};

  //! ESTO SE VA - Esta petición no se una para el perfil pero es un ejemplo de como traer varios registros
  Future<void> getUsers() async {
    final response = await _dio.get(
        "${APIConfig.apiUrl}/usuarios");

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
    const url =
        '${APIConfig.apiUrl}/usuarios/login';

    // Datos que deseas enviar en el cuerpo de la solicitud
    final data = {
      'email': email,
      'contrasena': password,
    };

    //- Codifica los datos en formato JSON
    final jsonData = jsonEncode(data);


    try {
      

    // Realiza la solicitud POST
    final response = await _dio.post(url, data: jsonData);


    //* Verifica el código de estado de la respuesta
    if (response.statusCode == 200) {
      //* La solicitud POST fue exitosa, puedes manejar la respuesta aquí

      /// Lo que hacemos es decidar en base a las respuestas de nuestro servidor si debemos llenar la propiedad de profile o la de errores
      if (response.data["message"] != null) {
        //- Llenamos nuestra propiedad de errores
        response.data["message"] == "Usuario no encontrado"
            ? errores["messageEmail"] = response.data["message"]
            : errores["messagePassword"] = response.data["message"];
      } else {
        //- Llenamos nuestra propiedad del usuario que se registró
        Map<String, dynamic> formatProfile = response.data;
        final profile02 =
            ProfileModel.fromJson(formatProfile).toProfileEntity();

        profile["id"] = profile02.id;
        profile["name"] = profile02.name;
        profile["lastName"] = profile02.lastName;
        profile["email"] = profile02.email;
        profile["phone"] = profile02.phone;
        profile["password"] = profile02.password;
        profile["state"] = profile02.state;
        profile["rolName"] = profile02.rolName;

        print("Que pasa...");
        print(profile);
      }

    } else {
      //* La solicitud POST falló con un código de estado diferente de 200
      throw Exception(
          "La solicitud POST falló con el código de estado ${response.statusCode}");
    }
    } catch (e) {
      print(e);
    } finally {
      notifyListeners(); //! Esto es para cuando la información del provider cambie notificar de estos cambios en todos los lugares donde sea usado proveedor
    }

    
  }

  void vaciarErrores() {
    errores = {"messageEmail": "", "messagePassword": ""};
    notifyListeners();
  }

  void singOff() {
    profile = {
      "id": "",
      "name": "",
      "lastName": "",
      "phone": "",
      "email": "",
      "password": "",
      "state": "",
      "rolName": ""
    };
    notifyListeners();
  }

  Future<void> editProfile(name, lastName, phone, email) async {
    profile["name"] = name;
    profile["lastName"] = lastName;
    profile["phone"] = phone;
    profile["email"] = email;

    notifyListeners();

    final data = {
      'nombre': name,
      'apellido': lastName,
      'telefono': phone,
      'email': email,
    };

    final jsonData = jsonEncode(data);

    var _id = profile["id"];
    try {
      final response = await _dio.patch(
        '${APIConfig.apiUrl}/usuarios/$_id',
        data: jsonData,
      );

      if (response.statusCode == 201) {
        print('Usuario editado exitosamente');
        print('Respuesta: ${response.data}');
        // Puedes realizar alguna acción adicional si es necesario
      } else {
        print('Error al editar el usuario');
        print('Código de estado: ${response.statusCode}');
        print('Mensaje de error: ${response.statusMessage}');
      }
    } catch (error) {
      print('Error al editar el usuario: $error');
    }

    notifyListeners();
  }

  Future<void> changePassword(
      String currentPassword, String newPassword) async {
    final data = {
      'contrasenaActual': currentPassword,
      'contrasenaNueva': newPassword,
    };

    final jsonData = jsonEncode(data);

    int id = profile["id"];

    try {
      final response = await _dio.patch(
        '${APIConfig.apiUrl}/usuarios/cambiarContrasena/$id;',
        data: jsonData,
      );

      print('Contraseña editada o no');
      print('Respuesta: ${response.data}');

      if (response.data["message"] == "Contraseña actual incorrecta") {
        errores["messagePassword"] = response.data["message"];
      }
      // Puedes realizar alguna acción adicional si es necesario
    } catch (error) {
      print('Error al editar el usuario: $error');
    }

    notifyListeners();
  }
}
