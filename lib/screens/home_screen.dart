import 'dart:ffi';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController _carouselController = CarouselController();
  int _currentPage = 0;
  List image =[
        "https://media.istockphoto.com/id/612854434/photo/success-is-a-collaborative-effort.jpg?s=612x612&w=0&k=20&c=9-s-WiLTpROzE5C5qmllkOJUldp8n5z7WctOoPjZ_kM=",
        "https://images.pexels.com/photos/926390/pexels-photo-926390.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-926390.jpg&fm=jpg",
        "https://media.istockphoto.com/id/522865558/photo/yes-to-success.jpg?b=1&s=612x612&w=0&k=20&c=4czOgv2MT1Q8OD30NPSMoN0k7_fOngxsMzjS5bH99qM=",
  ];
  getBussinesDetails (){

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffFFEBF1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
           const SizedBox(height: 50,),
          SizedBox(
              height: 180,
              width: double.infinity,
              child: CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: image.length,
                options: CarouselOptions(
                  aspectRatio: 0.8,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
                itemBuilder: (ctx, index, realIdx) {
                  return SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(image[index]),
                              //  opacity: 0.6,
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: double.infinity,
                        ),
                      ],
                    ),
                  );
                },
              )),
          DotsIndicator(
            dotsCount: image.length,
            position: _currentPage,
            decorator: const DotsDecorator(
              color: Color(0xffD4D4D6), // Inactive color
              activeColor: Color(0xffFFEBF1),
            ),
          ),


            const SizedBox(height: 15,),
            const Text("Popular Businesses this month", style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600 ),),

            const SizedBox(height: 20,),
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(children: [
                   Container(
                     height: 130,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Colors.white,
                     ),
                     child: Center(
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                         const Text("Subscribe to view content", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600 ),),
                           const SizedBox(height: 7,),
                           Container(
                             height: 45,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(20),
                               color: const Color(0xfff760b1).withOpacity(0.5),

                             ),

                             child: const Padding(
                               padding: EdgeInsets.all(8.0),
                               child: Row(children: [
                               Icon(Icons.lock_open),
                                 SizedBox(width: 2,),
                                 Text("Subscribe"),
                                                        ],),
                             ),)
                       ],),
                     ),

                   ),),
                   const SizedBox(width: 10,),
                   Container(

                     height: 130,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Colors.white,
                     ),

                     child: Center(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             const Text("Subscribe to view content", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600 ),),
                             const SizedBox(height: 7,),
                             Container(
                               height: 45,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 color: const Color(0xfff760b1).withOpacity(0.5),

                               ),

                               child: const Padding(
                                 padding: EdgeInsets.all(8.0),
                                 child: Row(children: [
                                   Icon(Icons.lock_open),
                                   SizedBox(width: 2,),
                                   Text("Subscribe"),
                                 ],),
                               ),)
                           ],),
                       ),

                     ),),
                 ],),
               ),


            const SizedBox(height: 15,),

            const Text("Upcoming Events for January", style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600 ),),


        ],),
      ),
    );
  }
}
