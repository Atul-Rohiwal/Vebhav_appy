import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Common/Bold_Text.dart';
import 'package:untitled2/Common/Plain_text.dart';

import '../../Common/Constant.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({super.key});

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          title: Text("Profile"),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'Assets/Carpenter/Carpanter.jpeg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BoldText(name: "Mr. Sunny Rohiwal", fontsize: 25),
                  PlainText(name: "vebhav@gmail.com", fontsize: 20),
                  SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 20,
                  ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,color: Colors.blue,),
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                    ),
                  SizedBox(
                    height:10
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email,color: Colors.blue,),
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(
                      height:10
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone,color: Colors.blue,),
                        hintText: "Phone-No",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(
                      height:10
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_city,color: Colors.blue,),
                        hintText: "City",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(
                      height:10
                  ),

                ]))));
  }
}
