import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop/components/bottomNavigationBar.dart';
import 'package:onlineshop/widgets.dart';

class sirala extends StatefulWidget {
  const sirala({Key? key}) : super(key: key);

  @override
  State<sirala> createState() => _siralaState();
}

class _siralaState extends State<sirala> {



  String modelAdi = '';
  String modelFiyati = '';
  String modelGorsel = '';

  List<Map<String, dynamic>> IphoneModeller = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchGelenVeri();
  }

  Future<void> fetchGelenVeri() async {
    QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('ıphone').get();

    if (snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
        String? modelAdi = data?['modelAdi']?.toString();
        String? modelGorsel = data?['modelGorsel']?.toString();
        String? modelFiyati = data?['modelFiyati']?.toString();

        IphoneModeller.add({
          'modelAdi': modelAdi ?? '',
          'modelGorsel': modelGorsel ?? '',
          'modelFiyati':modelFiyati ?? '',
        });
      }

      setState(() {
        this.IphoneModeller = IphoneModeller;
      });
    } else {
      print('I phone modeller bulunamadı.');
    }
  }



  @override
  Widget build(BuildContext context,) {
    final double deviceWidth = MediaQuery.of(context).size.width - 32;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: IphoneModeller.map((model) {
                      String modelAdi = model['modelAdi'] ?? '';
                      String modelGorsel = model['modelGorsel'] ?? '';
                      String modelFiyati = model['modelFiyati'] ?? '';
                      return buildSalesItem(
                        context: context,
                        deviceWidth: deviceWidth,
                        catagori: modelAdi,
                        discountRate: modelFiyati,
                        imageUrl: modelGorsel,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            buildBottomNavigationBar("search",context),
          ],
        ),
      ),
    );
  }
}

