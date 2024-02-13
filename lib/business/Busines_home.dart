import 'dart:ffi';

import 'package:flutter/material.dart';
class BusinessHome extends StatefulWidget {
  const BusinessHome({Key? key}) : super(key: key);

  @override
  State<BusinessHome> createState() => _BusinessHomeState();
}

class _BusinessHomeState extends State<BusinessHome> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
             const Row(children: [
               Expanded(child: SizedBox(width: 2,),),
               Text("Businesses", style: TextStyle(color: Color(0xffFF72AD), fontSize: 18, fontWeight: FontWeight.w600),),
               Expanded(child: SizedBox(width: 2,),),
               Icon(Icons.search, color: Color(0xff999CAD),),
             ],),

              const SizedBox(height: 15,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  border: Border.all(color:  const Color(0xffFF72AD),
                  ),

                ),
                child: const Center(
                  child: Text(
                    "Add New Business",
                    style: TextStyle(fontSize: 18.0, color: Color(0xffFF72AD),),
                  ),
                ),
              ),

              const SizedBox(height: 15,),
              Row(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", height: 120,width: 130, fit: BoxFit.cover,)),
                    const SizedBox(height:  10,),
                    const Text(
                      "Alteri Athletics",
                      style: TextStyle(fontSize: 18.0, color: Color(0xff4E4E4E),fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "Casual Deal",
                      style: TextStyle(fontSize: 12.0, color: Color(0xff979797),),
                    ),
                    const Text(
                      "Up to 50% OFF",
                      style: TextStyle(fontSize: 16.0, color: Color(0xffFF72AD),fontWeight: FontWeight.w600),
                    ),

                  ],),
                const Expanded(child: SizedBox(width: 1,)),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network("https://media.istockphoto.com/id/1470130937/photo/young-plants-growing-in-a-crack-on-a-concrete-footpath-conquering-adversity-concept.webp?b=1&s=170667a&w=0&k=20&c=IRaA17rmaWOJkmjU_KD29jZo4E6ZtG0niRpIXQN17fc=", height: 120,width: 130, fit: BoxFit.cover,)),
                    const SizedBox(height:  10,),
                    const Text(
                      "Alteri Athletics",
                      style: TextStyle(fontSize: 18.0, color: Color(0xff4E4E4E),fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "Casual Deal",
                      style: TextStyle(fontSize: 12.0, color: Color(0xff979797),),
                    ),
                    const Text(
                      "Up to 50% OFF",
                      style: TextStyle(fontSize: 16.0, color: Color(0xffFF72AD),fontWeight: FontWeight.w600),
                    ),

                  ],),
                const SizedBox(width: 10,),
              ],),
              const SizedBox(height: 20 ,),
              Row(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network("https://cdn.pixabay.com/photo/2016/07/07/16/46/dice-1502706_640.jpg", height: 120,width: 130, fit: BoxFit.cover,)),
                    const SizedBox(height:  10,),
                    const Text(
                      "Alteri Athletics",
                      style: TextStyle(fontSize: 18.0, color: Color(0xff4E4E4E),fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "Casual Deal",
                      style: TextStyle(fontSize: 12.0, color: Color(0xff979797),),
                    ),
                    const Text(
                      "Up to 50% OFF",
                      style: TextStyle(fontSize: 16.0, color: Color(0xffFF72AD),fontWeight: FontWeight.w600),
                    ),

                  ],),
                const Expanded(child: SizedBox(width: 1,)),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network("https://img.freepik.com/premium-photo/painting-lake-with-mountains-sun-shining-it_865053-55.jpg", height: 120,width: 130, fit: BoxFit.cover,)),
                    const SizedBox(height:  10,),
                    const Text(
                      "Alteri Athletics",
                      style: TextStyle(fontSize: 18.0, color: Color(0xff4E4E4E),fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "Casual Deal",
                      style: TextStyle(fontSize: 12.0, color: Color(0xff979797),),
                    ),
                    const Text(
                      "Up to 50% OFF",
                      style: TextStyle(fontSize: 16.0, color: Color(0xffFF72AD),fontWeight: FontWeight.w600),
                    ),

                  ],),
                const SizedBox(width: 10,),
              ],),

            ],

          ),
        ),
      ),
    );
  }
}
