import 'package:flutter/material.dart';
import 'package:onlineshop/components/bottomNavigationBar.dart';
import 'package:onlineshop/header.dart';

class cart extends StatefulWidget {
  String title;
  String imageUrl;
  int price;
  Color color;
  int option;

  cart({
    this.title = '',
    this.imageUrl = '',
    this.price = 0,
    this.color = Colors.transparent,
    this.option = 0,
  });

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(context, 'Cart'),
                  SizedBox(
                    height: 4,
                  ),

                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color:Colors.white.withOpacity(0.94),
                            borderRadius: BorderRadius.circular(13),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity (0.25),
                                    blurRadius: 9,
                                    offset: Offset(0, 7)
                                ),

                              ]
                          ),

                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      widget.imageUrl,
                                      fit: BoxFit.scaleDown,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Text(widget.title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                                              SizedBox(width: 10,),
                                              Container(width:15 ,height: 15, decoration: BoxDecoration(shape:BoxShape.circle,color: widget.color),),
                                            ],
                                          ),
                                          Text(widget.option.toString() + "gb"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            child: Icon(Icons.remove_circle_outline_outlined,size: 20,),
                                            onTap: () {
                                              setState(() {
                                                count == 1
                                                    ? showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                "Ona bir şans daha verin!!!"),
                                                            content: Text(
                                                                "${widget.title + " ürününü almamak istediğinize emin misiniz ?"}"),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    count--;
                                                                  });
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                    "Evet Bu Ekranı Kapat"),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(context).pop();
                                                                },
                                                                child: Text(
                                                                    'Hayır Kalsın'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      )
                                                    : count--;
                                              });
                                            },
                                          ),
                                          SizedBox(width: 6,),
                                          Text(
                                            '$count',
                                            textScaleFactor: 2.2,
                                          ),
                                          SizedBox(width: 6,),
                                          GestureDetector(
                                            child: Icon(Icons
                                                .add_circle_outline_outlined,size: 25,),
                                            onTap: () {
                                              setState(() {
                                                count++;
                                                print(count);
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // add more children widgets here
                ],
              ),
            ),
            buildBottomNavigationBar('cart',context)
          ],
        ),
      ),
    );
  }
}
