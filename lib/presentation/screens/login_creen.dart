import 'package:colch_stat_app/config/constants/enviroment.dart';
import 'package:colch_stat_app/infrastruture/alerts/alertHelper.dart';
import 'package:colch_stat_app/presentation/providers/profile_provider.dart';
import 'package:colch_stat_app/presentation/screens/sales_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


final Uri _url = Environment.webUrl;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Raleway',
        colorScheme: const ColorScheme.light(),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});
  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
              vertical: 40, horizontal: 30), // Margen externo
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Image.asset('assets/images/LogoPNG.png'),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Usuario',
                        hintStyle: const TextStyle(color: Colors.black),
                        prefixIcon: const Icon(Icons.email,
                            color: Colors.black), // Cambia el color del ícono
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.black), // Cambia el color del borde
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          // profileProvider.vaciarErrores();
                          return 'El usuario es obligatorio';
                        } else if (!RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(value)) {
                          // profileProvider.vaciarErrores();
                          return 'El correo electrónico no tiene un formato válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                        hintStyle: const TextStyle(color: Colors.black),
                        prefixIcon: const Icon(Icons.lock, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'La contraseña es obligatoria';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () async {
                          String password = _passwordController.text;
                          String email = _emailController.text;

                          if (_formKey.currentState!.validate()) {
                            // //! Lo que hago es buscar el perfil en la API
                            await profileProviderSingleton.profileProvider
                                .getProfile(email, password);
                            // Agrega setState para que la vista se actualice
                            setState(() {});

                            /// Mandar alerta por si algo ocurrió o si es usuario de encontró correctamente lo dejamos pasar

                            if (profileProviderSingleton
                                    .profileProvider.error ==
                                "") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SalesScreen(),
                                ),
                              );
                            } else {
                              AlertHelper.showErrorSnackBar(
                                  context,
                                  profileProviderSingleton
                                      .profileProvider.error);

                              profileProviderSingleton.profileProvider
                                  .vaciarError();
                            }

                            try {
                              // Hacer algo con los datos del perfil, como mostrarlos en la interfaz de usuario.
                            } catch (error) {
                              // Manejar cualquier error que pueda ocurrir durante la obtención de datos.
                              print(error);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF000000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Iniciar sesión',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),


                    GestureDetector(
                      onTap: _launchUrl,
                      child: const Text(
                        "Recuperar contraseña",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
