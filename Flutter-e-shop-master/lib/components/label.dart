import 'package:flutter/material.dart';

Widget label ({required String discountRate}) {
  return
    Container(

    padding: EdgeInsets.all (4),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular (2),
        color: Color (0xFFE0ECF8)),
    child: Text(
      discountRate,
      style:
      TextStyle(color: Color (0xFF1F53E4), fontSize: 12),
    ),
  );
}
Widget kalp () {
  return
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular (30),
          color: Color (0xFFE0ECF8)),
      child: Icon(
        Icons.favorite,
        color: Colors.red,
      ),
    );
}