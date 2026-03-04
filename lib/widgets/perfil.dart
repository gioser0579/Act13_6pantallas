import 'package:flutter/material.dart';
import 'bienvenida.dart'; // Importante para el Badge y el Logo si se ocupa

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // URL de la imagen de perfil (puedes cambiarla por cualquier link de internet)
    const String urlImagenPerfil = "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";

    return Scaffold(
      backgroundColor: const Color(0xFF1B262C), // Fondo oscuro solicitado
      appBar: AppBar(
        title: const Text("MI PERFIL", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3282B8),
        iconTheme: const IconThemeData(color: Colors.white),
        // REQUISITO: AppBar con 2 iconos en las acciones
        actions: const [
          Icon(Icons.edit, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.share, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            
            // FOTO DE PERFIL CIRCULAR DESDE LA WEB
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFBBE1FA), width: 4),
                ),
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.white,
                  backgroundImage: const NetworkImage(urlImagenPerfil),
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // INFORMACIÓN DEL USUARIO
            _infoItem("Nombre de Usuario", "Gioser Fisher"),
            _infoItem("Número de Teléfono", "+52 123 456 7890"), // <--- CAMBIO REALIZADO AQUÍ
            _infoItem("Correo Electrónico", "gioser.fisher@tech.com"),
            
            const SizedBox(height: 40),
            
            // REQUISITO: Nombre y Grupo en la pantalla
            const StudentBadge(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget reutilizable para las filas de información
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