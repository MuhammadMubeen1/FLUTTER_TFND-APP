// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tfnd/auth/sign_up.dart';
import '../const/api_const.dart';
import 'package:http/http.dart' as http;
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obsecure =true;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var data;
  TextEditingController email  = TextEditingController();
  TextEditingController password  = TextEditingController();
  loginUser()async{
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(ApiConstants.baseUrl+ApiConstants.login));
    request.body = json.encode({
      "email": email.text,
      "password": password.text,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
     // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var message = body ['message'];


      Fluttertoast.showToast(
        msg: message,
      );
      setState(() {
        data = body ['data'] ??[];
        print("all data = ${data}");
        print("token = ${data['token']}");
        isLoading = false;
      });
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomNavBar()));
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
                  const SizedBox(height: 50,),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome back", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 10,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Yaaay! Enter your password to continue", style: TextStyle(fontSize: 13, ),),
                  ],
                ),

                const SizedBox(height: 15,),

                Card(
                  elevation: 5, // Set the elevation value as per your preference
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    controller: email,
                    validator: (value) =>
                    value!.isEmpty ? 'Name cannot be blank' : null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter Email",
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
                const SizedBox(height: 10,),
                Card(
                  elevation: 5, // Set the elevation value as per your preference
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(

                    obscureText: obsecure,

                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                     controller: password,

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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Forgot password?", style: TextStyle(fontSize: 16, color: Color( 0xfff760b1)),),
                  ],
                ),
                const SizedBox(height: 10,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not you?", style: TextStyle(fontSize: 13, color: Color( 0xfff760b1)),),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                      },
                        child: const Text("Create Account", style: TextStyle(fontSize: 14, color: Colors.grey),)),
                  ],
                ),


                 const SizedBox(height: 35,),
                 isLoading?const Center(child: CircularProgressIndicator()):
                 GestureDetector(
                   onTap: (){
                  if (_formKey.currentState!.validate()) {
                    loginUser();
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
                       child: Text("Login", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),) ,
                     ),

                   ),
                 ),

              ],),
            ),
          ),
        ),
      ),


    );
  }
}
