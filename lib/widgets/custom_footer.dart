import 'package:flutter/material.dart';

import '../screens/alarm_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

class CustomFooter extends StatelessWidget {
  final int selectedIndex;

  const CustomFooter({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // Fondo con curvas
        ClipPath(
          clipper: FooterClipper(),
          child: Container(
            height: 80,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: Icons.calendar_today,
                  index: 0,
                  selectedIndex: selectedIndex,
                  onPressed: () => _onItemTapped(context, 0),
                ),
                _buildNavItem(
                  icon: Icons.access_time,
                  index: 1,
                  selectedIndex: selectedIndex,
                  onPressed: () => _onItemTapped(context, 1),
                ),
                SizedBox(width: 60), // Espacio para el botón central
                _buildNavItem(
                  icon: Icons.notifications,
                  index: 2,
                  selectedIndex: selectedIndex,
                  onPressed: () => _showNotificationModal(context), // Mostrar modal
                ),
                _buildNavItem(
                  icon: Icons.person,
                  index: 3,
                  selectedIndex: selectedIndex,
                  onPressed: () => _onItemTapped(context, 3),
                ),
              ],
            ),
          ),
        ),
        // Botón central elevado
        Positioned(
          bottom: 35,
          child: GestureDetector(
            onTap: () => _showMicModal(context), // Acción del botón central
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFF735BF2),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                Icons.mic,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
    required int selectedIndex,
    required void Function() onPressed,
  }) {
    return IconButton(
      icon: Icon(
        icon,
        color: index == selectedIndex ? Color(0xFF735BF2) : Colors.grey,
        size: 28,
      ),
      onPressed: onPressed,
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AlarmScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;
      default:
        print("Índice desconocido");
    }
  }

  void _showMicModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 20),
              Icon(Icons.mic, size: 80, color: Color(0xFF735BF2)),
              SizedBox(height: 16),
              Text(
                "Talk to make an alarm",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Cierra el modal
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF735BF2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Close",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showNotificationModal(BuildContext context) {
    DateTime? selectedDate;
    TimeOfDay? startTime;
    TimeOfDay? endTime;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Add New Event",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Event",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "Type the note here...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () async {
                    selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (selectedDate != null) {
                      print("Fecha seleccionada: ${selectedDate!}");
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedDate != null
                              ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                              : "Select Date",
                        ),
                        Icon(Icons.calendar_today, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          startTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (startTime != null) {
                            print("Hora de inicio seleccionada: ${startTime!.format(context)}");
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                            child: Text(
                              startTime != null
                                  ? startTime!.format(context)
                                  : "Start time",
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          endTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (endTime != null) {
                            print("Hora de fin seleccionada: ${endTime!.format(context)}");
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                            child: Text(
                              endTime != null
                                  ? endTime!.format(context)
                                  : "End time",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  "Select Sound",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCategoryButton("Record", Icons.mic),
                    _buildCategoryButton("From Device", Icons.folder),
                    _buildCategoryButton("Generate AI", Icons.smart_toy),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  "Select Category",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    _buildChip("Brainstorm", Colors.purple),
                    _buildChip("Design", Colors.green),
                    _buildChip("Workout", Colors.blue),
                    GestureDetector(
                      onTap: () {
                        // Lógica para añadir nueva categoría
                      },
                      child: Text(
                        "+ Add new",
                        style: TextStyle(color: Color(0xFF735BF2)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Acción para crear evento
                  },
                  child: Text("Create Event", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF735BF2),
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  Widget _buildCategoryButton(String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        // Acción del botón
      },
      icon: Icon(icon, size: 12, color: Colors.white),
      label: Text(label, style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF735BF2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 6,
            backgroundColor: color,
          ),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class FooterClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
      size.width / 4, size.height,
      size.width / 2, size.height - 20,
    );
    path.quadraticBezierTo(
      3 * (size.width / 4), size.height - 40,
      size.width, size.height - 20,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
