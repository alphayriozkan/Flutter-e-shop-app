import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop/Pages/homePage.dart';
import 'package:onlineshop/RegisterPage.dart';
import 'package:onlineshop/components/my_button.dart';
import 'package:onlineshop/components/my_textfield.dart';
import 'package:onlineshop/components/square_tile.dart';
import 'package:onlineshop/utilities/sing_google.dart';


class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

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
      //backgroundColor: Colors.grey[300],
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://t3.ftcdn.net/jpg/02/92/90/56/360_F_292905667_yFUJNJPngYeRNlrRL4hApHWxuYyRY4kN.jpg"
            ),
            fit: BoxFit.cover,
          ),

        ),
        child: SafeArea(
          child: Center(
            child: ListView(

              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children:[ Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                ]
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  onTap: signUserIn,
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(imagePath: 'https://static.vecteezy.com/system/resources/previews/002/520/838/original/apple-logo-black-isolated-on-transparent-background-free-vector.jpg'),

                    SizedBox(width: 25),

                    // apple button
                    isFireBaseInitalied
                        ? GestureDetector (
                        onTap: () async {
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
                        child: SquareTile(imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZWAes1AOGt1D2ld72Yc3_kXJCP4Rv6NO8IRjpwrn8Ew&s',))
                        : CircularProgressIndicator(),
                  ],


                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
