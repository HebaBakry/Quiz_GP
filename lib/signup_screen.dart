import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'input_border.dart';
import 'package:country_picker/country_picker.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{
  TextEditingController email = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController birthdate = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  DateTime? _selectedDate;
  String label = 'Select your country';
  bool isVisible = false;
  String? errEmail;
  String? errRePass;
  Color color = const Color(0xff82498d);

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != _selectedDate) {
        birthdate.text = picked.toString().substring(0,10);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign up',style: TextStyle(fontSize: 25),),
          centerTitle: true,
          backgroundColor: color,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,), onPressed: () {Navigator.pop(context); },
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    const Padding(
                        padding:  EdgeInsets.fromLTRB(15,15,15,10),
                        child:  Text('Create an account',style: TextStyle(fontSize: 30),textAlign: TextAlign.start,)
                    ),
                    const Padding(
                        padding:  EdgeInsets.fromLTRB(6,0,10,6),
                        child:  Text('Please complete your profile.\nDon\'t worry your data remain private and only you can see it',style: TextStyle(fontSize: 17,color: Colors.grey),textAlign: TextAlign.center)
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: fullName,
                        decoration: InputDecoration(
                          //myInputBorder() and myFocusBorder() functions in input_border file
                          enabledBorder: myInputBorder(),
                          focusedBorder: myFocusBorder(),
                          labelText: 'FullName',
                          labelStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 15
                          ),
                          suffixIcon:  Icon(
                            Icons.account_circle, color: color,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        onChanged: (val){
                          if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)){
                            errEmail = 'Please enter correct email';
                          }
                          else{
                            errEmail = null;
                          }
                          setState(() {
                          });
                        },
                        decoration: InputDecoration(
                          //myInputBorder() and myFocusBorder() functions in input_border file
                          enabledBorder: myInputBorder(),
                          focusedBorder: myFocusBorder(),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 15
                          ),
                          errorText: errEmail,
                          errorStyle: const TextStyle(color: Colors.red,fontSize: 12),
                          errorBorder: myErrorBorder(),
                          suffixIcon:  Icon(
                            Icons.email_rounded, color: color,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        controller: phone,
                        decoration: InputDecoration(
                          //myInputBorder() and myFocusBorder() functions in input_border file
                          enabledBorder: myInputBorder(),
                          focusedBorder: myFocusBorder(),
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 15
                          ),
                          suffixIcon:  Icon(
                            Icons.call, color: color,),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: TextField(
                            readOnly: true,
                            keyboardType: TextInputType.text,
                            controller: country,
                            decoration: InputDecoration(
                              //myInputBorder() and myFocusBorder() functions in input_border file
                                enabledBorder: myInputBorder(),
                                focusedBorder: myFocusBorder(),
                                labelText: label,
                                labelStyle: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 15
                                ),
                                suffixIcon:IconButton(
                                  onPressed: () {
                                    showCountryPicker(
                                      context: context,
                                      onSelect: (Country value) {
                                        country.text = '${value.flagEmoji}  ${value.name}';
                                      },
                                    );
                                  },
                                  icon:  Icon(Icons.search,color: color,),
                                )))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: TextField(
                          readOnly: true,
                          controller: birthdate,
                          decoration:  InputDecoration(
                            enabledBorder: myInputBorder(),
                            focusedBorder: myInputBorder(),
                            labelText: 'Date of Birth',
                            suffixIcon:IconButton(onPressed: () => _selectDate(context),
                              icon:  Icon(Icons.calendar_month,color: color,),),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: TextField(
                        obscureText: !isVisible,
                        controller: password,
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
                            // counter: InkWell(
                            //     onTap: () {
                            //       // Navigator.push(context,
                            //       //     MaterialPageRoute(builder: (
                            //       //         context) => const ResetPass(),));
                            //     },
                            //     child: Text(
                            //       'Forgot Password?',
                            //       style: TextStyle(color: Colors.grey.shade700,
                            //           fontSize: 14),
                            //     )
                            // ),

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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: TextField(
                        obscureText: !isVisible,
                        controller: rePassword,
                        onChanged: (val){
                          if(val != password.text){
                            errRePass = 'Not Match';
                          }
                          else{
                            errRePass = null;
                          }
                          setState(() {
                          });
                        },
                        decoration: InputDecoration(
                          //myInputBorder() and myFocusBorder() functions in input_border file
                            enabledBorder: myInputBorder(),
                            focusedBorder: myFocusBorder(),
                            labelText: 'Re-Password',
                            labelStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 15
                            ),
                            errorText: errRePass,
                            errorStyle: const TextStyle(color: Colors.red,fontSize: 12),
                            errorBorder: myErrorBorder(),
                            //put 'Forgot Password?' in counter place
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
                        child: const Text('Create account', style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) =>  const LogIn()));
                            },
                            child: const Text('log in')
                        )
                      ],
                    ),

                  ],))
        )
    );
  }
}