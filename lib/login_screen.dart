import 'package:flutter/material.dart';
import 'reset_password_screen.dart';
import 'type_of_account_screen.dart';
import 'input_border.dart';



// Log in screen
class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //check if password visible or not
  bool isVisible = false;
  Color color = const Color(0xff82498d);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Log in',style: TextStyle(fontSize: 25),),
          centerTitle: true,
          backgroundColor: color,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //to add space only
                    const SizedBox(height: 20,),
                    const ClipOval(
                      child: Image(
                        width: 300,
                        height: 300,
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/login.jpg'
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          //myInputBorder() and myFocusBorder() functions in input_border file
                          enabledBorder: myInputBorder(),
                          focusedBorder: myFocusBorder(),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 15
                          ),
                          suffixIcon:  Icon(
                            Icons.email_rounded, color:color,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: TextField(
                        obscureText: !isVisible,
                        controller: passwordController,
                        decoration: InputDecoration(
                          //myInputBorder() and myFocusBorder() functions in input_border file
                            enabledBorder: myInputBorder(),
                            focusedBorder: myFocusBorder(),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 15
                            ),
                            //put 'Forgot Password?' in counter place
                            counter: InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (
                                          context) => const ResetPass(),));
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Colors.grey.shade700,
                                      fontSize: 14),
                                )
                            ),

                            suffixIcon: InkWell(
                              onTap: () {
                                //use setState to toggle password visibility
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Icon(isVisible ? Icons.visibility : Icons
                                  .visibility_off, color: color,),
                            )
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 10),
                      width: 250,
                      height: 50,
                      decoration:  BoxDecoration(
                          border: Border.fromBorderSide(
                              BorderSide(
                                  color: color,
                                  width: 2
                              )
                          ),
                          color: color,
                          borderRadius: const BorderRadius.all(Radius.circular(20))
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Log in', style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                            onPressed: () {
                            Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) =>  const TypeOfAccountScreen(),
                            ));},
                            child:  Text('Sign Up',style: TextStyle(color: color),)
                        )
                      ],
                    ),

                  ],))
        )
    );
  }
}