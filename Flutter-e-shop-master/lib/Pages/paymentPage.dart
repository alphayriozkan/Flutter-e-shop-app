import 'package:flutter/material.dart';

class OdemePage extends StatefulWidget {
  const OdemePage({Key? key}) : super(key: key);

  @override
  State<OdemePage> createState() => _OdemePageState();
}

class _OdemePageState extends State<OdemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Ödeme"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 40, top: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Kart Numarası",
                            icon: Icon(Icons.credit_card)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 40),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Ad-Soyad",
                            icon: Icon(Icons.account_circle_outlined)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18 , right: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "CVV",
                                  icon: Icon(Icons.password_sharp)
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                  hintText: "MM/YY",
                                  icon: Icon(Icons.calendar_month)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),),

              Padding(
                padding: const EdgeInsets.all(70.0),
                child: ElevatedButton(
                  child: Text("Onayla ve Bitir"),
                  onPressed: (){

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
