import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // AppBar personalizado
          const CustomAppBar(isRegisterPage: true),
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
                        Text(
                          "Welcome Michael!",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.grey[600],
                              ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Registrar Usuario",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  // Campos del formulario
                  CustomTextField(
                    label: "Nombre",
                    hintText: "Nombre*",
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    label: "Correo",
                    hintText: "Correo*",
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    label: "Password",
                    hintText: "Password*",
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    label: "Edad",
                    hintText: "Edad*",
                  ),
                  SizedBox(height: 32),
                  // Botón Registrarse
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para el registro
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF735BF2),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Registrarse",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
