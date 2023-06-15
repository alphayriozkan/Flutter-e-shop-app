import 'package:flutter/material.dart';
import 'package:onlineshop/Cart.dart';
import '../widgets.dart';

Widget buildBottomNavigationBar(String page ,context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(color: Color(0xFFEFF5FB), boxShadow: [
        BoxShadow(
            offset: Offset(0, -3),
            color: Colors.black.withOpacity(0.20),
            blurRadius: 30),
      ]),
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            child: buildNavIcon(
              icon: Icons.home_outlined,
              active: page == "home",
            ),
          ),
          GestureDetector(onTap: (){Navigator.pushNamed(context, '/search');},child: buildNavIcon(icon: Icons.search_rounded, active: page == "search")),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Cart() ));
              },
              child: buildNavIcon(
                icon: Icons.shopping_bag_outlined, active: page == "Cart"),
          ),
          GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/profile');
              },child: buildNavIcon(
                icon: Icons.person_outline_sharp, active: page == "profile"),
          ),
        ],
      ), // Row
    ),
  );
}
