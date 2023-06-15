import 'package:flutter/material.dart';
import 'package:onlineshop/components/bottomNavigationBar.dart';
import 'package:onlineshop/widgets.dart';

class CategoriesPage extends StatelessWidget {
  String? catagoryTitle;
  CategoriesPage({required this.catagoryTitle});
  List<String> catagories = ['Asus','Casper','Monster'];
  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: buildPagesHeader(context: context,header: catagoryTitle ,catagories:catagories,),
            ),
            buildBottomNavigationBar("shop",context),
          ],
        ),
      ),
    );
  }


}
