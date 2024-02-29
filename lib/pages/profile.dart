import 'package:delichi/pages/edit_profile.dart';
import 'package:delichi/pages/login.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.jpg'), // Reemplaza con la ruta de la imagen
            ),
            const SizedBox(height: 20),
            const Text(
              'Maria Camacho',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Correo : usuario@example.com',
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfilePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Color de fondo naranja para el botón
              ),
              child: const Text('Editar Perfil',
              style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 20,),
            Material(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text(
                  'Cerrar sesión',
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
    );
  }
}
