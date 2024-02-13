import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:tfnd/navigationbar/navigation_bar.dart';
import '../const/api_const.dart';
import 'login_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obsecure =true;
  bool isLoading = false;
  var data;
  final _formKey = GlobalKey<FormState>();
  String selectedCountryCode = "+92";
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  registerUser()async{
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(ApiConstants.baseUrl+ApiConstants.signUp));
    request.body = json.encode({
      "firstName": firstName.text,
      "lastName": lastName.text,
      "email": email.text,
      "age": "",
      "address": "",
      "phoneNumber": selectedCountryCode+phoneNumber.text,
      "password": password.text,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
   //   print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var message = body ['message'];


      Fluttertoast.showToast(
        msg: message,
      );
      setState(() {
        data = body ['data'] ??[];
        print("all data = ${data}");
        isLoading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomNavBar()));
    }
    else {
      print(response.reasonPhrase);
      setState(() {
        isLoading = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: const Color(0xffFFEBF1),

      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(

              child: Column(children: [
                const SizedBox(height: 20,),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Sign up", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 10,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("or", style: TextStyle(fontSize: 13, ),),
                    const SizedBox(width: 5,),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                        },
                        child: const Text("Sign in", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xfff760b1)),)),
                  ],
                ),

                const SizedBox(height: 15,),
           Row(children: [
             Flexible(

               child: Card(

                 elevation: 5, // Set the elevation value as per your preference
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: TextFormField(
                   controller: firstName,
                   textCapitalization: TextCapitalization.words,
                   keyboardType: TextInputType.name,
                   // controller: name,
                   validator: (value) =>
                   value!.isEmpty ? 'Name cannot be blank' : null,
                   decoration: InputDecoration(
                     filled: true,
                     fillColor: Colors.white,
                     hintText: "First Name",
                     enabledBorder: const OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       borderSide: BorderSide(width: 1, color: Colors.white),
                     ),


                     focusedBorder: const OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       borderSide: BorderSide(width: 1, color: Colors.white),
                     ),
                     disabledBorder:   const OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       borderSide: BorderSide(width: 1, color: Colors.white),
                     ),

                     errorBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: const BorderSide(width: 1, color: Colors.redAccent),
                     ),
                   ),
                 ),
               ),
             ),
             Flexible(

               child: Card(
                 elevation: 5, // Set the elevation value as per your preference
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: TextFormField(

                   controller: lastName,

                   textCapitalization: TextCapitalization.words,
                   keyboardType: TextInputType.name,
                   // controller: name,

                   validator: (value) =>
                   value!.isEmpty ? 'Name cannot be blank' : null,
                   decoration: InputDecoration(



                     filled: true,
                     fillColor: Colors.white,

                     hintText: "Last Name",
                     enabledBorder: const OutlineInputBorder(

                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       borderSide: BorderSide(width: 1, color: Colors.white),
                     ),
                     focusedBorder: const OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       borderSide: BorderSide(width: 1, color: Colors.white),
                     ),
                     errorBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: const BorderSide(width: 1, color: Colors.redAccent),
                     ),

                   ),
                 ),
               ),
             ),
           ],),


                const SizedBox(height: 5,),

                Card(
                  elevation: 5, // Set the elevation value as per your preference
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(

                    controller: email,

                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    // controller: name,

                    validator: (value) =>
                    value!.isEmpty ? 'Name cannot be blank' : null,
                    decoration: InputDecoration(



                      filled: true,
                      fillColor: Colors.white,

                      hintText: "Email",
                      enabledBorder: const OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 1, color: Colors.redAccent),
                      ),

                    ),
                  ),
                ),
                const SizedBox(height: 5,),

              Row(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(10),bottomLeft:Radius.circular(10)  ),
                      color: Colors.white,
                    ),
                    child: CountryCodePicker(
                      showDropDownButton: true,
                      onChanged: (CountryCode country) {
                        setState(() {
                          selectedCountryCode = country.dialCode!;
                        });
                      },
                      initialSelection: 'PK',
                      favorite: const ['+92', 'PK'],
                      showFlagDialog: true,
                     // comparator: (a, b) => b.name!.compareTo(a.!name),
                    ),
                  ),
                  //const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: phoneNumber,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter Phone Number",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(topRight:Radius.circular(10),bottomRight:Radius.circular(10)  ),
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(topRight:Radius.circular(10),bottomRight:Radius.circular(10)  ),
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      //initialValue: '+92', // Initial dial code

                    ),
                  ),
                ],
              ),





                const SizedBox(height: 5,),
                Card(
                  elevation: 5, // Set the elevation value as per your preference
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                  controller: password,
                    obscureText: obsecure,

                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    // controller: name,

                    validator: (value) =>
                    value!.isEmpty ? 'Name cannot be blank' : null,
                    decoration: InputDecoration(
                      suffixIcon:  GestureDetector(
                          onTap: (){
                            setState(() {
                              obsecure= !obsecure;
                            });
                          },

                          child: Icon(obsecure? Icons.visibility:Icons.visibility_off,color:  const Color(0xfff760b1))),


                      filled: true,
                      fillColor: Colors.white,

                      hintText: "Enter Password",
                      enabledBorder: const OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 1, color: Colors.redAccent),
                      ),

                    ),
                  ),
                ),
                const SizedBox(height: 15,),



                const SizedBox(height: 35,),

                isLoading?const Center(child: CircularProgressIndicator()):
                GestureDetector(
                  onTap: (){

                    if (_formKey.currentState!.validate()) {
                      registerUser();

                    }
                  },
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffE597A8),

                    ),
                    child: const Center(
                      child: Text("Register", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),) ,
                    ),

                  ),
                ),

                const SizedBox(height: 15,),


                const Text("By Tapping Register, you agree to our Terms of user and Privacy",
                  style: TextStyle(fontSize: 16, ), textAlign: TextAlign.center,),

              ],),
            ),
          ),
        ),
      ),


    );
  }
}
