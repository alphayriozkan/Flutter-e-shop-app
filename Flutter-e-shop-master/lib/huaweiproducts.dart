import 'package:flutter/material.dart';

class HuaweiPage extends StatefulWidget {
  const HuaweiPage({super.key});

  @override
  State<HuaweiPage> createState() => _HuaweiPageState();
}

class _HuaweiPageState extends State<HuaweiPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Huawei"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 10),
        child: SizedBox(
          //width: 500,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0,left: 10),
                    child: Column(
                      children: [
                        SizedBox(
                            width: 140,
                            height: 120,
                            child: Image.asset("resimler/mateX3.png")),
                        SizedBox(height: 25,),
                        Text("Mate X3",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0 ,right: 15,),
                    child: Column(
                      children: [
                        SizedBox(
                            width: 160,
                            height: 140,
                            child: Image.asset("resimler/matebook16.webp")
                        ),
                        SizedBox(height: 8,),
                        Text("Matebook D16",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0,left: 10),
                    child: Column(
                      children: [
                        SizedBox(
                            width: 140,
                            height: 120,
                            child: Image.asset("resimler/p60pro.webp")),
                        SizedBox(height: 25,),
                        Text("Mate X3",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0 ,right: 15),
                    child: Column(
                      children: [
                        SizedBox(
                            width: 160,
                            height: 140,
                            child: Image.asset("resimler/matebookd15.jpeg")
                        ),
                        SizedBox(height: 8,),
                        Text("Matebook D16",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
