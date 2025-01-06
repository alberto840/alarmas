import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  int selectedAmPmIndex = 1; // 0: AM, 1: PM
  int selectedHour = 9; // 1-12
  int selectedMinute = 30; // 1-60
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Ajusta la pantalla al teclado
      backgroundColor: Color(0xFFF5F5FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Regresa a la pantalla anterior
          },
        ),
        title: Text(
          'Alarma',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100), // Espaciado superior
              // Selectores de horario
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: _buildAmPmSelector()),
                  Expanded(child: _buildHourSelector()),
                  Expanded(child: _buildMinuteSelector()),
                ],
              ),
              SizedBox(height: 200),
              // Campo de etiqueta (label)
              TextField(
                decoration: InputDecoration(
                  hintText: "Label",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF735BF2)),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
              SizedBox(height: 24),
              // Campo de fecha
              GestureDetector(
                onTap: _selectDate,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDate == null
                            ? "Select Date"
                            : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      Icon(Icons.calendar_today, color: Colors.grey),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              // Hora de inicio y fin
              Row(
                children: [
                  Flexible(
                    child: _buildDateTimeField(
                      label: "Start time",
                      icon: Icons.access_time,
                      onTap: () {
                        // Lógica para seleccionar hora de inicio
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Flexible(
                    child: _buildDateTimeField(
                      label: "End time",
                      icon: Icons.access_time,
                      onTap: () {
                        // Lógica para seleccionar hora de fin
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Botón para crear evento
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Acción para crear el evento
                    print("Evento creado");
                    print("Fecha seleccionada: ${selectedDate?.toString() ?? "No seleccionada"}");
                    print("AM/PM: ${selectedAmPmIndex == 0 ? 'AM' : 'PM'}");
                    print("Hora: $selectedHour");
                    print("Minuto: $selectedMinute");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF735BF2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  ),
                  child: Text(
                    "Create Event",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmPmSelector() {
    return SizedBox(
      width: 70,
      height: 140,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 60,
        diameterRatio: 1.5,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          setState(() {
            selectedAmPmIndex = index;
          });
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            if (index < 0 || index > 1) return null;
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: selectedAmPmIndex == index
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedAmPmIndex == index
                        ? Color(0xFF735BF2)
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                width: 60,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  index == 0 ? 'AM' : 'PM',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: selectedAmPmIndex == index ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            );
          },
          childCount: 2,
        ),
      ),
    );
  }

  Widget _buildHourSelector() {
    return SizedBox(
      width: 70,
      height: 140,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 60,
        diameterRatio: 1.5,
        perspective: 0.003,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          setState(() {
            selectedHour = index + 1;
          });
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            if (index < 0 || index >= 12) return null;
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: selectedHour == (index + 1)
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedHour == (index + 1)
                        ? Color(0xFF735BF2)
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                width: 60,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: selectedHour == (index + 1)
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
              ),
            );
          },
          childCount: 12,
        ),
      ),
    );
  }

  Widget _buildMinuteSelector() {
    return SizedBox(
      width: 70,
      height: 140,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 60,
        diameterRatio: 1.5,
        perspective: 0.003,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          setState(() {
            selectedMinute = index + 1;
          });
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            if (index < 0 || index >= 60) return null;
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: selectedMinute == (index + 1)
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedMinute == (index + 1)
                        ? Color(0xFF735BF2)
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                width: 60,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  '${index + 1}'.padLeft(2, '0'),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: selectedMinute == (index + 1)
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
              ),
            );
          },
          childCount: 60,
        ),
      ),
    );
  }

  void _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Widget _buildDateTimeField({
    required String label,
    required IconData icon,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Icon(icon, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
