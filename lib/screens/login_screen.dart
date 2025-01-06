import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_icons_row.dart';
import '../widgets/custom_app_bar.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(isRegisterPage: false),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 40),
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/Component.png', // Cambia por tu logo
                          height: 80,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Welcome Michael!",
                          style: Theme.of(context).textTheme.bodyLarge, // Cambiado
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Iniciar Sesion",
                          style: Theme.of(context).textTheme.titleLarge, // Cambiado
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  CustomTextField(
                    label: "Correo",
                    hintText: "Event name*",
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    label: "Password",
                    hintText: "Event name*",
                    obscureText: true,
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF735BF2),
                    ),
                    child: Text(
                      "Iniciar Sesion",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF735BF2),
                      side: BorderSide(color: const Color(0xFF735BF2)),
                    ),
                    child: Text(
                      "Registrarse",
                      style: TextStyle(
                        fontSize: 16, color: const Color(0xFF735BF2)),
                    ),
                  ),
                  Spacer(),
                  SocialIconsRow(),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
