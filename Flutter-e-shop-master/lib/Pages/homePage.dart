import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onlineshop/Favorites.dart';
import 'package:onlineshop/Pages/SplashScreen.dart';
import 'package:onlineshop/Pages/login_page.dart';
import 'package:onlineshop/catagories.dart';
import 'package:onlineshop/components/bottomNavigationBar.dart';
import 'package:onlineshop/huaweiproducts.dart';
import 'package:onlineshop/main.dart';
import 'package:onlineshop/utilities/sing_google.dart';
import 'package:onlineshop/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> items = [
    'https://img-teknosa-sap.mncdn.com/home/widget/widget_sunnytvkamp_230601.jpg',
    'https://img-teknosa-sap.mncdn.com/home/widget/widget_hp_victuskamp_230530.jpg',
    'https://img-teknosa-sap.mncdn.com/home/widget/widget_ssh_microsoftkamp_230529.jpg',
    'https://img-teknosa-sap.mncdn.com/home/widget/widget_shazaprojeksiyon_230601.jpg',
    'https://img-teknosa-sap.mncdn.com/home/widget/widget_neutronhavatemizleyicisi_230601.jpg',
  ];

  List<Map<String, dynamic>> markalar = [];
  List<Map<String, dynamic>> modeller = [];

  String markaAdi = '';
  String markaLogo = '';

  String modelAdi = '';
  String modelFiyati = '';


  @override
  void initState() {
    super.initState();
    fetchMarkaData();
  }

  Future<void> fetchMarkaData() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('markalar').get();

    if (snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
        String? markaAdi = data?['markaAdi']?.toString();
        String? markaLogo = data?['markaLogo']?.toString();

        markalar.add({
          'markaAdi': markaAdi ?? '',
          'markaLogo': markaLogo ?? '',
        });
      }

      setState(() {
        this.markalar = markalar;
      });
    } else {
      print('Markalar bulunamadı.');
    }
  }




  @override
  Widget build(BuildContext context) {
    //ThemeData themeData = Theme.of(context);
    final double deviceWidth = MediaQuery.of(context).size.width - 32;
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 55),
                child: ListView(children: [
                  //BASLIK
                  buildHeader(),

                  //BANNER
                  buildBanner(),

                  //Carosuel
                  CarouselSlider(
                    items: items.map((item) {
                      return Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            item as String,
                            fit: BoxFit.cover,
                            width: deviceWidth,
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      clipBehavior: Clip.antiAlias,
                      height: 200,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.easeInOut,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),

                  //BUTONLAR
                  Padding(
                    padding: const EdgeInsets.only(top: 48.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //İlk eleman
                        buildNavigationBar(
                            icon: Icons.menu_outlined,
                            text: 'Catagories',
                            context: context,
                            widget: CategoriesPage(
                              catagoryTitle: 'Categories',
                            )),
                        buildNavigationBar(
                            icon: Icons.favorite_outline_outlined,
                            text: 'Favorites',
                            context: context,
                            widget: Favorites(
                            )),
                        buildNavigationBar(
                            icon: Icons.show_chart, text: 'Best Sellings'),
                        buildNavigationBar(
                            icon: Icons.card_giftcard_outlined, text: 'Gifts'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  //SALES
                  //Markalar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Markalar',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A1034)),
                      ),
                    ],
                  ),

                  //Marka adı,Marka Logosu listelenecek ve tıklandığında o markanın katagori listesine gidece

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sales',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A1034)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Wrap(
                      children: markalar.map((marka) {
                        String markaAdi = marka['markaAdi'];
                        String markaLogo = marka['markaLogo'];
                        return buildSalesItem(
                          context: context,
                          deviceWidth: deviceWidth,
                          catagori: markaAdi,
                          discountRate: '%50',
                          imageUrl: markaLogo,
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: SizedBox(
                      height: 220,
                      //width: 500,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0,),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: 140,
                                    height: 120,
                                    child: Image.asset("resimler/oppo.jpg")),
                                SizedBox(height: 25,),
                                Text("Oppo",style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0 ,right: 5),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: 160,
                                    height: 140,
                                    child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HuaweiPage()));
                                        },
                                        child: Image.asset("resimler/huawei.jpeg"))
                                ),
                                SizedBox(height: 8,),
                                Text("Huawei",style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              // BOTTOM NAVIGATION BAR
              buildBottomNavigationBar("home", context),
            ],
          ),
        ));
  }
}
