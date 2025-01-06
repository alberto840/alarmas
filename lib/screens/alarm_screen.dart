import 'package:flutter/material.dart';
import '../widgets/custom_footer.dart';
import 'create_event_screen.dart';

class AlarmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            // Título
            Center(
              child: Text(
                'Alarma',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Lista de alarmas
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildAlarmCard(
                    time: '10:00–13:00',
                    title: 'Design new UX flow for Michael',
                    description: 'Start from screen 16',
                    color: Colors.green,
                  ),
                  _buildAlarmCard(
                    time: '14:00–15:00',
                    title: 'Brainstorm with the team',
                    description:
                        'Define the problem or question that.. View more',
                    color: Colors.purple,
                  ),
                  _buildAlarmCard(
                    time: '19:00–20:00',
                    title: 'Workout with Ella',
                    description: 'We will do the legs and back workout',
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Botón flotante para agregar alarmas
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16, right: 16),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateEventScreen()),
            );
          },
          backgroundColor: Color(0xFF735BF2),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // Pie de navegación personalizado
      bottomNavigationBar: CustomFooter(selectedIndex: 1), // Resalta el ícono de "Reloj"
    );
  }

  Widget _buildAlarmCard({
    required String time,
    required String title,
    required String description,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.circle, size: 12, color: color),
                SizedBox(width: 8),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
