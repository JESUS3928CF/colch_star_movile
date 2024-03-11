import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

class Environment {
  // se puede centralizar el codigo desde aca mismo
  static initEnvironment() async {
    await dotenv.load(fileName: '.env');
  }

  static String apiUrl = dotenv.env["API_URL"] ?? "No está configurada";

  static final Uri webUrl = Uri.parse(dotenv.env["WEB_URL"] ?? "No está configurada");
  

}
