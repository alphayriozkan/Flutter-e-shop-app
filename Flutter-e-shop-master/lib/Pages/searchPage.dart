import 'package:flutter/material.dart';
import 'package:onlineshop/components/bottomNavigationBar.dart';
import 'package:onlineshop/product.detail.dart';
import 'package:onlineshop/widgets.dart';

class SearchPage extends StatefulWidget {
  String productTitle;
  SearchPage({required this.productTitle});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map> products = [
    {
      "name": "Excalibur",
      "photoUrl": "https://pngimg.com/uploads/laptop/laptop_PNG101774.png",
      "price": "999"
    },
    {
      "name": "Excalibur 1",
      "photoUrl":
          "https://cdn.pixabay.com/photo/2013/07/12/15/04/monitor-149362_960_720.png",
      "price": "999"
    },
    {
      "name": "Excalibur 2",
      "photoUrl": "https://pngimg.com/uploads/laptop/laptop_PNG101774.png",
      "price": "999"
    },
    {
      "name": "Excalibur 3",
      "photoUrl":
          "https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_87300487/mobile_786_587_png/APPLE-iPhone-13-128-GB-Ak%C4%B1ll%C4%B1-Telefon-Starlight-MLPG3TU-A",
      "price": "999"
    },
    {
      "name": "Excalibur 5",
      "photoUrl": "https://pngimg.com/uploads/laptop/laptop_PNG101774.png",
      "price": "999"
    },
    {
      "name": "Excalibur 6",
      "photoUrl": "https://pngimg.com/uploads/laptop/laptop_PNG101774.png",
      "price": "999"
    },
    {
      "name": "Excalibur 7",
      "photoUrl": "https://pngimg.com/uploads/laptop/laptop_PNG101774.png",
      "price": "999"
    },
  ];

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //header1
                  buildPagesHeader(
                    header: widget.productTitle,
                    context: context,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Gölgelendirme offset değeri
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search_rounded, color: Colors.blue),
                        hintText: 'Bir metin yazın',
                      ),
                      onChanged: (value) {
                        print('Girilen metin: $value');
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  //content
                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                      children: products.map((product) {
                        return buildContent(product["name"],
                            product["photoUrl"], product["price"], context);
                      }).toList(),
                    ),
                  ),
                  //bottomnavigation
                ],
              ),
            ),
            buildBottomNavigationBar("search", context),
          ],
        ),
      ),
    );
  }
}

Widget buildContent(String title, String photoUrl, String price, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(
          productImageUrl: photoUrl,
          productTitle: title,
        );
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: Offset(0, 16),
          ), // BoxShadow
        ],
      ), // BoxDecoration
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              photoUrl,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF0A1034),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ), // Textstyle
              ), // Text
              Text(
                "USD $price",
                style: TextStyle(
                  color: Color(0xFF0001FC),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ), // TextStyle
              ), // Text
            ],
          ),
        ],
      ),
    ),
  );
}
