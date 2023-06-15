import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemSamples extends StatefulWidget {
  const CartItemSamples({super.key});

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}
int count=1;
int sayac =1;
class _CartItemSamplesState extends State<CartItemSamples> {


  @override
  Widget build(BuildContext context) {

    //int count=1;

    return Column(
      children: [
        Container(
          height: 110,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Radio(
                  value: "",
                  groupValue: "",
                  activeColor: Colors.indigo,
                  onChanged: (index){
                  },
              ),
              Container(
                height:70,
                width: 70,
                margin: EdgeInsets.only(right: 15),
                child: Image.asset("resimler/1.png"),
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Excalibur" , style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo),),
                    Text("\$65" , style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.indigo),),
                  ],
                ),
              ),
              SizedBox(
                width: 55,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.delete,color: Colors.red,),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ]
                            ),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  count++;
                                });
                              },
                              child: Icon(
                                CupertinoIcons.plus,
                                size: 18,
                              ),
                            ),
                          ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("$count",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ]
                          ),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                count--;
                              });
                            },
                            child: Icon(
                              CupertinoIcons.minus,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 110,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Radio(
                value: "",
                groupValue: "",
                activeColor: Colors.indigo,
                onChanged: (index){
                },
              ),
              Container(
                height:70,
                width: 70,
                margin: EdgeInsets.only(right: 15),
                child: Image.asset("resimler/2.webp"),
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Iphone 13 " , style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo),),
                    Text("\$65" , style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.indigo),),
                  ],
                ),
              ),
              SizedBox(
                width: 55,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.delete,color: Colors.red,),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ]
                          ),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                sayac++;
                              });
                            },
                            child: Icon(
                              CupertinoIcons.plus,
                              size: 18,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("$sayac",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ]
                          ),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                sayac--;
                              });
                            },
                            child: Icon(
                              CupertinoIcons.minus,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],

    );
  }
}
