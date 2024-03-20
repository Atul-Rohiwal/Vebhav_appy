import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Common/Constant.dart';
import 'package:untitled2/Common/Plain_text.dart';
import 'package:untitled2/Common/Bold_Text.dart';
import 'package:get/get.dart';
import 'package:untitled2/Providers/User.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, User, _) {
      return Drawer(
          backgroundColor: Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildHeader(context),
              SizedBox(height: 10,),
              buildMenuItems(context),
            ],
          )
      );
    }
    );
  }


  Widget buildHeader(BuildContext context) =>  Consumer<User>(builder: (context,User,_) {
    return Container(
      // color: appColor,

      padding: EdgeInsets.only(top: 40, left: 30),
      // decoration: BoxDecoration(),
      child: Row(
        children: [

        CircleAvatar(
        radius: 30,
        backgroundColor: Colors.red,
      ),

      SizedBox(width: 10),
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            children: [
              Text('Welcome,  ',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
              Text(User.name,style: TextStyle(fontSize: 14,color: Colors.white),),
            ],
          ),
            PlainText(
              name: User.email,
              fontsize: 14,
              color: Colors.white,
            )
      ],
    ),]
    ,
    )
    ,
    );
  }
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: EdgeInsets.only(left: 25),
    color: appColor,
    child: Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.list,color: Colors.white,
          ),
          title: BoldText(
            name: "Listing",color: Colors.white,
            fontsize: 13,
          ),
          onTap: () {
            // Get.to(() => Listing());
          },
        ),
        ListTile(
          leading: Icon(
            Icons.chat,color: Colors.white,
          ),
          title: BoldText(
            name: "Customer Questions",color: Colors.white,
            fontsize: 13,
          ),
          onTap: () {
            // debugPrint(userName);

            Get.to(());
          },
        ),
        ListTile(
          leading: Icon(
            Icons.shopping_cart_outlined,color: Colors.white,
          ),
          title: BoldText(
            name: "Orders",color: Colors.white,
            fontsize: 13,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.keyboard_return,color: Colors.white,
          ),
          title: BoldText(
            name: "Returns",color: Colors.white,
            fontsize: 13,
          ),
          onTap: () {},
        ),

        ListTile(
          leading: Icon(
            Icons.shopping_bag,color: Colors.white,
          ),
          title: BoldText(
            name: "Sell More",color: Colors.white,
            fontsize: 13,
          ),
          onTap: () {
            // Get.to(() => Sell_More());
          },
        ),

      ],
    ),
  );
}