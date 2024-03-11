import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  // se puede centralizar el codigo desde aca mismo 
  static initEnvironment( ) async {
    await dotenv.load(fileName: '.env');
  }

  static String apiUrl = dotenv.env["API_URL"] ?? "No está configurada";
}
