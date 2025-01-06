import 'package:flutter/material.dart';

class SocialIconsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 20,
          child: Icon(Icons.g_mobiledata_outlined, color: Colors.white),
        ),
        SizedBox(width: 16),
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 20,
          child: Icon(Icons.facebook, color: Colors.white),
        ),
        SizedBox(width: 16),
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 20,
          child: Icon(Icons.apple, color: Colors.white),
        ),
      ],
    );
  }
}
