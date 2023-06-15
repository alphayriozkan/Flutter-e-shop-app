



import 'package:flutter/material.dart';
import 'package:onlineshop/Pages/deneme.dart';
import 'package:onlineshop/components/label.dart';
import 'package:onlineshop/header.dart';
import 'package:onlineshop/productPage.dart';

Widget buildBanner() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Container(

      width: double.infinity,
      padding:
      EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xFF0001FC),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0001FC),
            Colors.greenAccent.withOpacity(0.8),
          ],
        ),
      ),

      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bose Home Speaker',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'USD 214',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Expanded(flex: 4,
              child: Container(

                height: 75,
                child: Image.asset('assets/images/a.png',),
              ),
            )

          ]),
    ),
  );
}

Widget buildHeader() {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Row(
      children: [

        Text(
          'Home',
          style: TextStyle(
              fontSize: 34,
              color: Color(0xFF0A1034),
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
      ],
    ),
  );
}

GestureDetector buildNavigationBar( {required String text,required IconData icon, Widget? widget , BuildContext? context}) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context!, MaterialPageRoute(builder:(context)=>widget!));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19,vertical: 22),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE0ECF8),
          ),
          child: Icon(icon,color: Color(0xFF0001FC),size: 18,),
        ),
        SizedBox(height: 8),
        Center(child: Text(text,style: TextStyle(color: Color(0xFF1F53E4),fontWeight: FontWeight.w500),)),
      ],
    ),
  );
}

GestureDetector buildSalesItem({ required BuildContext context,required double deviceWidth,required String catagori,required String imageUrl,required String discountRate,}) {
  return GestureDetector(
      onTap: (){
        Navigator.push(context , MaterialPageRoute(builder: (context) {
          return sirala();
        },));
      },
      child: Container(width: deviceWidth/2,
      padding:
      EdgeInsets.only (left: 12, top: 12, bottom: 21, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         label(discountRate:discountRate),
          SizedBox(height: 22,),
          Container(height: 150 ,child: Image.network(imageUrl,fit: BoxFit.cover,)),
          SizedBox(height: 22,),
          Center(
            child: Text(catagori,
                style: TextStyle(
                    fontSize: 18, color: Color (0xFF0A1034))),
          ),
        ],
      ), // Column
    ),
  );
}

Widget buildNavIcon({required IconData icon,required bool active}){
  return Icon(icon, size: 30, color: Color(active?0xFF0001FC:0xFF0A1034));
}

GestureDetector buildCatagories({required String text,required BuildContext context}) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) {return ProductPage(productTitle: text);}));
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all (24),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular (6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity (0.25),
                blurRadius: 4,
                offset: Offset(0, 4)), // BoxShadow
          ]), // BoxDecoration
      child: Text(
        text,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color (0xFF0A1034)), // TextStyle
      ), // Text
    ),
  );
}

Widget buildPagesHeader({required String? header,List<String>? catagories,required BuildContext context}){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        Header(context,header),
      // kategoriler
      buildCatagoriList(catagories: catagories,header: header,context: context ),
    ],
  );
}

Widget buildCatagoriList({required List<String>? catagories,required String? header,required BuildContext context}) {
  if(catagories != null && catagories.isNotEmpty) {
    return Expanded(
      child: ListView(
        children: catagories.map((String title) => buildCatagories(text: title,context: context),).toList(),
      ),
    );
  } else {
    return Column();
  }
}
Widget colorPicker({Color? color, required bool isSelected , required Function onTap}){
  return
    Column(
      children: [
        GestureDetector(
          onTap: onTap as Function(),
          child: Container(
          height: 20,
          width: 20,
          decoration: (BoxDecoration(shape: BoxShape.circle,color: color,border: Border.all(width: isSelected ? 3 : 0))),
          ),
        ),
        SizedBox(width: 25,),
      ],
    );
}
Widget capaties ({required bool isActive ,required int option , required Function onTap}) {
  return
      Column(
        children: [
          GestureDetector(
            onTap: onTap as Function(),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Text('$option gb',
                style: TextStyle(
                color: isActive ? Color(0xFF0001FC) : Color(0xFF6F7972),
                fontSize: isActive ? 23 : 19 ,
              ),
              ),
            ),
          ),
        ],
      );
}