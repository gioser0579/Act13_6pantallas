import 'package:flutter/material.dart';
import 'bienvenida.dart'; // Importamos para usar el Logo y Badge

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBBE1FA), // Color de fondo diferente
      appBar: AppBar(
        title: const Text("INICIO SESIÓN"),
        actions: const [Icon(Icons.vpn_key), SizedBox(width: 10), Icon(Icons.help_center), SizedBox(width: 15)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const CreativeToothLogo(size: 80),
            const SizedBox(height: 30),
            const Text("Bienvenido de nuevo", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            TextField(decoration: InputDecoration(labelText: "Correo", filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)))),
            const SizedBox(height: 20),
            TextField(obscureText: true, decoration: InputDecoration(labelText: "Contraseña", filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)))),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0F4C75), minimumSize: const Size(double.infinity, 55)),
              onPressed: () => Navigator.pushNamed(context, '/navega'),
              child: const Text("ENTRAR", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 50),
            const StudentBadge(),
          ],
        ),
      ),
    );
  }
}