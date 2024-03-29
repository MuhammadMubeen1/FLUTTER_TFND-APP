import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;



class ApiServices{


  postService({required String uri,Map<String,dynamic>? body,Map<String,String>? header})async{
    print("Post");
    try{
      http.Response response=await http.post(
          Uri.parse(uri),
          body: jsonEncode(body),
          headers: header
      );
      print(response.body);
      print("I am  after post call");
      if(response.statusCode==200){
        return response;
      }else{
        return response;
      }

    }catch (e){
      EasyLoading.dismiss();
      Fluttertoast.showToast(
          msg: "Error: $e",


      );

    }

  }

  deleteService({required String uri,Map<String,dynamic>? body,Map<String,String>? header})async{
    print("Delete");
    http.Response response=await http.delete(
        Uri.parse(uri),
        body: jsonEncode(body),
        headers: header
    );
    print(response.body);
    print("I am  after post call");
    if(response.statusCode==200){
      return response;
    }else{
      return response;
    }


  }


  getService({required String uri,Map<String,String>? header})async{

    http.Response response=await http.get(
        Uri.parse(uri),


        headers: header
    );

    if(response.statusCode==200){

      return response;
    }else{
      return response;
    }


  }






}