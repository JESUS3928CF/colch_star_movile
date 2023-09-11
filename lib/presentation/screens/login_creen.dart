import 'package:colch_stat_app/presentation/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:colch_stat_app/presentation/screens/index_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const LoginScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

/// Instanciamos el proveedor para poder usar sus métodos
var profileProvider = ProfileProvider();

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
                  child: Image.asset('assets/images/Logooo.jpeg'),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Correo Electrónico',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorText: profileProvider.errores["messageEmail"],
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          // profileProvider.vaciarErrores();
                          print("Correo invalido");
                          print(profileProvider.errores);
                          return 'El correo es necesario';
                        } else if (!RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(value)) {
                          // profileProvider.vaciarErrores();
                          return 'Correo inválido';
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
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorText:
                              profileProvider.errores["messagePassword"]),
                      validator: (value) {
                        if (value!.isEmpty) {
                          // profileProvider.vaciarErrores();
                          print("contra vacía");
                          print(profileProvider.errores);
                          return 'La contraseña es necesaria';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () async {
                          String password = _passwordController.text;
                          String email = _emailController.text;

                          // profileProvider.vaciarErrores();
                          print("contra vacía");
                          print(profileProvider.errores);

                          // await profileProvider.getUsers();
                          // print(profileProvider.profileList[0].name);

                          if (_formKey.currentState!.validate()) {
                            profileProvider.vaciarErrores();
                            await profileProvider.getProfile(email, password);
                            // Agrega setState para que la vista se actualice
                            setState(() {});

                            if (profileProvider != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const IndexScreen(),
                                ),
                              );
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
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Iniciar',
                          style: TextStyle(fontSize: 18),
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
