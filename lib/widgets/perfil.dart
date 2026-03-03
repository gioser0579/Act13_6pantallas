import 'package:flutter/material.dart';
import 'bienvenida.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // URL de una imagen de la web (puedes cambiar esta URL por la que gustes)
    const String urlImagenPerfil = "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";

    return Scaffold(
      backgroundColor: const Color(0xFF1B262C), // Fondo oscuro para que resalte la foto
      appBar: AppBar(
        title: const Text("MI PERFIL", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3282B8), // Diferente color de fondo en AppBar
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          Icon(Icons.camera_alt, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.settings, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            
            // FOTO DE PERFIL DESDE LA WEB
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFBBE1FA), width: 4),
                    ),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      // AQUÍ CARGAMOS LA IMAGEN DE LA WEB
                      backgroundImage: const NetworkImage(urlImagenPerfil),
                      // Si la imagen falla o carga, podemos poner un widget de carga
                      child: ClipOval(
                        child: Image.network(
                          urlImagenPerfil,
                          errorBuilder: (context, error, stackTrace) => 
                            const Icon(Icons.person, size: 80, color: Colors.grey),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                    ),
                  ),
                  // Icono flotante para "editar" la foto
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFFBBE1FA),
                    child: Icon(Icons.edit, size: 20, color: Color(0xFF0F4C75)),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // INFORMACIÓN DEL ALUMNO
            _infoItem("Nombre de Usuario", "Gioser Fisher"),
            _infoItem("Grado y Grupo", "6-I"),
            _infoItem("Especialidad", "Programación / Dental Tech"),
            _infoItem("Correo Electrónico", "gioser.fisher@clinc.com"),
            
            const SizedBox(height: 50),
            
            // TU BADGE QUE NO PUEDE FALTAR
            const StudentBadge(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget para las filas de información
  Widget _infoItem(String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFFBBE1FA), fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 15)),
        ],
      ),
    );
  }
}