import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffFFEBF1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(

          child: Column(
            children: [
              const SizedBox(height: 50,),
              const CircleAvatar(
                radius: 48, // Image radius
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D'),
              ),

              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xfff760b1).withOpacity(0.5),
                    ),
                    child: const Center(
                     child: Icon(Icons.edit),
                    ),


                  ),
                ],
              ),
              const SizedBox(height: 20,),

              Container(

               // height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),





                child:  Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Username", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        TextFormField(
                          //controller: message,
                          validator: (value) =>
                          value!.isEmpty ? 'Message cannot be blank' : null,
                          decoration: InputDecoration(
                            hintText: "Lucy Stewart",
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 1, color: Colors.black38),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 1,   color: Colors.black38),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10), //<-- SEE HERE
                              borderSide:
                              const BorderSide(width: 1, color: Colors.redAccent),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Email Id", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        TextFormField(
                          //controller: message,
                          validator: (value) =>
                          value!.isEmpty ? 'Message cannot be blank' : null,
                          decoration: InputDecoration(
                            hintText: "Mukhtar.junaid@gmail.com",
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 1, color: Colors.black38),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 1,   color: Colors.black38),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10), //<-- SEE HERE
                              borderSide:
                              const BorderSide(width: 1, color: Colors.redAccent),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Phone Number", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        TextFormField(
                          //controller: message,
                          validator: (value) =>
                          value!.isEmpty ? 'Message cannot be blank' : null,
                          decoration: InputDecoration(
                            hintText: "+3324113670",
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 1, color: Colors.black38),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 1,   color: Colors.black38),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10), //<-- SEE HERE
                              borderSide:
                              const BorderSide(width: 1, color: Colors.redAccent),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),

                      ],),
                  ),

                ),),

              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: Container(
                  height: 45,
                width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xfff760b1).withOpacity(0.5),

                  ),

                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child:  Center(child: Text("Logout" , style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)),
                  ),),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: Container(
                  height: 45,
                 width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xfff760b1).withOpacity(0.5),

                  ),

                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child:  Center(child: Text("Delete account" , style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)),
                  ),),
              ),
              const SizedBox(height: 15,),



            ],),
        ),
      ),
    );
  }
}
