import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("DENTAL GIOSER"),
        actions: const [Icon(Icons.notifications), SizedBox(width: 15), Icon(Icons.more_vert), SizedBox(width: 15)],
      ),
      // --- AQUÍ ESTÁ EL TRUCO: SingleChildScrollView ---
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/admin'),
                  child: const Text(" Admi", style: TextStyle(color: Colors.grey)),
                ),
              ),
              const SizedBox(height: 30), // Espacio en lugar de Spacer
              const CreativeToothLogo(size: 130),
              const SizedBox(height: 30),
              const Text(
                "BIENVENIDO!!",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF0F4C75)),
              ),
              const SizedBox(height: 40),
              _btn(context, "Iniciar Sesión", '/login', const Color(0xFF3282B8)),
              const SizedBox(height: 15),
              _btn(context, "Registrarse", '/registro', const Color(0xFF1B262C)),
              const SizedBox(height: 50), // Espacio antes del nombre
              const StudentBadge(), // TU NOMBRE Y GRUPO
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _btn(BuildContext context, String text, String route, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(280, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}

// --- El resto de las clases (Logo y Badge) se quedan igual abajo ---
class CreativeToothLogo extends StatelessWidget {
  final double size;
  const CreativeToothLogo({super.key, this.size = 100});
  @override
  Widget build(BuildContext context) {
    return Container(width: size, height: size, child: CustomPaint(painter: ToothPainter()));
  }
}

class ToothPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF0F4C75)..style = PaintingStyle.fill;
    final path = Path();
    double w = size.width; double h = size.height;
    path.moveTo(w * 0.5, h * 0.25);
    path.cubicTo(w * 0.2, h * 0.15, w * 0.1, h * 0.4, w * 0.2, h * 0.6);
    path.cubicTo(w * 0.2, h * 0.85, w * 0.45, h * 0.9, w * 0.45, h * 0.7);
    path.lineTo(w * 0.5, h * 0.65); path.lineTo(w * 0.55, h * 0.7);
    path.cubicTo(w * 0.55, h * 0.9, w * 0.8, h * 0.85, w * 0.8, h * 0.6);
    path.cubicTo(w * 0.9, h * 0.4, w * 0.8, h * 0.15, w * 0.5, h * 0.25);
    canvas.drawPath(path, paint);
  }
  @override bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class StudentBadge extends StatelessWidget {
  const StudentBadge({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: const Color(0xFF1B262C), borderRadius: BorderRadius.circular(50)),
      child: const Text('GIOSER FISHER 6-I', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }
}