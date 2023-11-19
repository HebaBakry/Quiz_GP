import 'package:flutter/material.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});
  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  TextEditingController emailController = TextEditingController();
  Color color = const Color(0xff82498d);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password',
            style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,), onPressed: () {Navigator.pop(context); },
        ),
        backgroundColor: color,
      ),
        body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Padding(
                      //   padding: EdgeInsets.only(bottom: 10,left: 10),
                      //   child: Text(
                      //     'Reset Password',
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //         color: color,
                      //         fontSize: 30,
                      //         fontWeight: FontWeight.bold
                      //     ),
                      //   ),
                      // ),
                      Padding(
                          padding: const EdgeInsets.only(top:35,left: 10),
                          child:  Text(
                            'Enter your email address and we\'ll send an email to reset your password',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 20,
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left:10,right:10,top: 35,bottom: 25),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: color.withOpacity(0.7),width: 2)
                              ),
                              focusedBorder:  OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: color,width: 2)
                              ),
                              labelText: 'example@gmail.com',
                              labelStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15
                              ),
                              prefixIcon: const Icon(Icons.email_outlined,color: Colors.grey,)
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10),
                        width: double.infinity,
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
                          onPressed: () {
                          },
                          child:const Text('Send',style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),),),
                      ),
                    ],
                  ),)

        )
    );
  }
}
