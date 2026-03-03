import 'package:flutter/material.dart';
import 'bienvenida.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("PANEL ADMINISTRADOR"),
        backgroundColor: const Color(0xFFBBE1FA),
        actions: const [Icon(Icons.settings), SizedBox(width: 10), Icon(Icons.logout), SizedBox(width: 15)],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text("BIENVENIDO ADMINISTRADOR", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F4C75))),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15,
              children: [
                _card(Icons.medical_information, "Tratamientos"), _card(Icons.people, "Pacientes"),
                _card(Icons.assignment_ind, "Especialistas"), _card(Icons.event, "Citas"),
                _card(Icons.payments, "Pagos"), _card(Icons.reviews, "Reseñas"),
              ],
            ),
          ),
          const StudentBadge(),
        ],
      ),
    );
  }
  Widget _card(IconData icon, String text) => Card(
    color: const Color(0xFFF1F1F1),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, size: 40, color: const Color(0xFF3282B8)), const SizedBox(height: 10), Text(text)]),
  );
}