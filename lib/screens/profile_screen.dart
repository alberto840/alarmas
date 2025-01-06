import 'package:flutter/material.dart';
import '../widgets/custom_footer.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5FA), // Fondo
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            // Título
            Text(
              'Perfil',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            // Icono de perfil
            CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF735BF2),
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24),
            // Campos de texto
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildTextField(label: 'Nombre'),
                  SizedBox(height: 16),
                  _buildTextField(label: 'Correo'),
                  SizedBox(height: 16),
                  _buildTextField(label: 'Password'),
                  SizedBox(height: 16),
                  _buildTextField(label: 'Edad'),
                ],
              ),
            ),
          ],
        ),
      ),
      // Pie personalizado con el botón central
      bottomNavigationBar: CustomFooter(selectedIndex: 3), // Resalta el icono de perfil
    );
  }

  Widget _buildTextField({required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: 'Event name*',
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFF735BF2)),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ),
      ],
    );
  }
}
