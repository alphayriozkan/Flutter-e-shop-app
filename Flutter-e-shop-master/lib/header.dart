import 'package:flutter/material.dart';
Widget Header(BuildContext context,title){
  return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    SizedBox(height: 29),
    // Geri ikonu
    GestureDetector(
      child: Icon(Icons.arrow_back,
          color: Color(0xFF0A1034), size: 35),
      onTap: () {
        Navigator.of(context).pop();
      },
    ),
    SizedBox(height: 16),
    Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Color(0xFF0A1034)),
    ),
    SizedBox(height: 29),
    ]
  );

}