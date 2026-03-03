import 'package:flutter/material.dart';
import 'bienvenida.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3282B8), // Otro color de fondo
      appBar: AppBar(
        title: const Text("REGISTRATE AQUÍ", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [Icon(Icons.person_add, color: Colors.white), SizedBox(width: 10), Icon(Icons.info_outline, color: Colors.white), SizedBox(width: 15)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const CreativeToothLogo(size: 60),
            const SizedBox(height: 20),
            _input("Nombre Completo"), _input("Edad"), _input("Teléfono"), 
            _input("Correo"), _input("Contraseña"), _input("Confirmar Contraseña"),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1B262C), minimumSize: const Size(double.infinity, 55)),
              onPressed: () => Navigator.pop(context),
              child: const Text("CREAR CUENTA", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            const StudentBadge(),
          ],
        ),
      ),
    );
  }
  Widget _input(String label) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextField(decoration: InputDecoration(labelText: label, filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
  );
}