import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop/Pages/homePage.dart';
import 'package:onlineshop/utilities/sing_google.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFireBaseInitalied = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      initalizeFireBase();
      setState(() {
        isFireBaseInitalied = true;
      });
    });
  }

  Future<void> initalizeFireBase() async {
    await Firebase.initializeApp();
  }

  void gotoHomePage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'İşleminiz gerçekleştiriliyor lütfen biraz bekleyin',
                textScaleFactor: 2,
              ),
              isFireBaseInitalied
                  ? ElevatedButton (
                  onPressed: () async {
                    try{
                      await signInWithGoogle();
                      String uid = FirebaseAuth.instance.currentUser!.uid;

                      await FirebaseFirestore.instance.collection('users').doc(uid).set(
                        {
                          'user_name':FirebaseAuth.instance.currentUser!.displayName,
                          'is_signed':true,
                          'last_sign_date':FieldValue.serverTimestamp(),
                        },
                        SetOptions(merge: true),
                      );



                      gotoHomePage();
                    }
                    catch(e){
                      print('Error during sign in with Google: $e');
                    }
                  },
                  child: Text('Sign With Google'))
                  : CircularProgressIndicator(),
            ],
          )),
    );
  }
}