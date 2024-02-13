// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart'as http;
// import '../const/api_const.dart';
// import 'api_services.dart';
//
// class AuthServices{
//
//   login(String email, String password,BuildContext context)async{
//
//     var header= {
//       'Content-Type':'application/json'
//     };
//     String uri=ApiConstants.baseUrl+ApiConstants.login;
//     Map<String ,dynamic> body={
//       'email':email,
//       'password':password,
//       'isAdmin': false
//     };
//
//     print(uri);
//     print(body);
//     http.Response response=await ApiServices().postService(uri:uri,body:body,header: header);
//     print(response.body);
//     if(response.statusCode==200){
//       var data=jsonDecode(response.body);
//
//       Provider.of<CurrentUserProvider>(context,listen: false).
//       updateUser(UserModel.fromJson(data['data']));
//
//       print(response.body);
//       print(response.body);
//       return true;
//     }else{
//       return false;
//     }
//
//
//   }
//
//
//
// }