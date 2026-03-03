import 'package:flutter/material.dart';
import 'widgets/bienvenida.dart';
import 'widgets/inicio_sesion.dart';
import 'widgets/registro.dart';
import 'widgets/administrador.dart';
import 'widgets/navegacion.dart';
import 'widgets/perfil.dart';

void main() => runApp(const ClinicaDentalApp());

class ClinicaDentalApp extends StatelessWidget {
  const ClinicaDentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dental Gioser',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/registro': (context) => const RegisterScreen(),
        '/admin': (context) => const AdminScreen(),
        '/navega': (context) => const NavScreen(),
        '/perfil': (context) => const ProfileScreen(),
      },
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Verdana',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F4C75)),
      ),
    );
  }
}