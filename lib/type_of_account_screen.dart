import 'package:flutter/material.dart';
import 'signup_screen.dart';

import 'login_screen.dart';


// Log in screen
class TypeOfAccountScreen extends StatefulWidget {
  const TypeOfAccountScreen({super.key});

  @override
  State<TypeOfAccountScreen> createState() => _TypeOfAccountScreenState();
}

class _TypeOfAccountScreenState extends State<TypeOfAccountScreen>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //check if password visible or not
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ClipOval(
                      child: Image(
                        width: 300,
                        height: 300,
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/quiz2.jpg'
                        ),
                      ),
                    ),
                  const Text('What type of account do you like to create?',
                    style:TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500
                    ),
                  textAlign: TextAlign.center,),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(15),
                      width: double.infinity,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Color(0xff82498d),
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>  const SignUp()));

                        },
                        child: const Text('Teacher', style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),),),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(15,0,15,15),
                      width: double.infinity,
                      height: 50,
                      decoration:  const BoxDecoration(
                          color: Color(0xff82498d),
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>  const SignUp()));
                        },
                        child: const Text('Student', style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?',style: TextStyle(fontSize: 20),),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) =>  const LogIn()));
                            },
                            child: const Text('log in',style: TextStyle(fontSize: 20),)
                        )
                      ],
                    ),
                  ],)
        )
    );
  }
}