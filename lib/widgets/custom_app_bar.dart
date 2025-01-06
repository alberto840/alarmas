import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool isRegisterPage;

  const CustomAppBar({required this.isRegisterPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF735BF2),
                ),
                child: Center(
                  child: Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                "Calender.io",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 16,
                height: 2,
                color: isRegisterPage ? Colors.grey : Colors.black,
              ),
              SizedBox(width: 4),
              Container(
                width: 16,
                height: 2,
                color: isRegisterPage ? Colors.black : Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
