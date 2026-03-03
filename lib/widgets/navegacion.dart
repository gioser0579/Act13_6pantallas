import 'package:flutter/material.dart';
import 'bienvenida.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NAVEGA AQUÍ"),
        actions: [
          const Icon(Icons.search),
          const SizedBox(width: 10),
          IconButton(icon: const Icon(Icons.account_circle, size: 30), onPressed: () => Navigator.pushNamed(context, '/perfil')),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CreativeToothLogo(size: 80),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(30),
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20,
              children: [
                _box(Icons.add_task, "Agendar Cita", Colors.red[100]!),
                _box(Icons.map, "Ubicación", Colors.blue[100]!),
                _box(Icons.medical_services, "Tratamientos", Colors.teal[100]!),
                _box(Icons.star_rate, "Reseñas", Colors.yellow[100]!),
              ],
            ),
          ),
          const StudentBadge(),
        ],
      ),
    );
  }
  Widget _box(IconData i, String t, Color c) => Container(
    decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.black12)),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(i, size: 45), const SizedBox(height: 10), Text(t, style: const TextStyle(fontWeight: FontWeight.bold))]),
  );
}