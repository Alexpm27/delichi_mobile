import 'package:delichi/widgets/appbar_go_back.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GoBack(title: 'Regisro'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'REGISTRO',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange), // Borde naranja en la parte inferior cuando se enfoca
                  ),
                  focusColor: Colors.orange,
                ),
                style: TextStyle(),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  labelStyle: TextStyle(color: Colors.black), // Color de texto naranja para el label
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(), // Borde naranja en la parte inferior
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange), // Borde naranja en la parte inferior cuando se enfoca
                  ),
                  focusColor: Colors.orange,
                ),
                style: TextStyle(), // Color de texto naranja para el input
              ),
              const SizedBox(height: 20),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(), //
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange), // Borde naranja en la parte inferior cuando se enfoca
                  ),
                ),
                style: TextStyle(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Color de fondo naranja para el botón
                  textStyle: const TextStyle(color: Colors.white), // Color de texto blanco para el botón
                ),
                child: const Text('Registrar',
                  style: TextStyle(color: Colors.white),),
              ),
              const SizedBox(height: 20),
              Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    '¿Ya tienes una cuenta?',
                    style: TextStyle(
                      color: Colors.orange, // Color naranja para el texto de registro
                      decoration: TextDecoration.underline, // Subrayado
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

