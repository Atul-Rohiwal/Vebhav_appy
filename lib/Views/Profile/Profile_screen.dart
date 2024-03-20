import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Common/Bold_Text.dart';
import 'package:untitled2/Common/Constant.dart';
import 'package:untitled2/Common/Plain_text.dart';
import 'package:untitled2/Views/Profile/Edit_Profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: Text("Profile"),
        leading: IconButton(onPressed: (){
          Get.back();

        },
        icon: Icon(Icons.arrow_back_ios_rounded),),
        actions: [
          Icon(Icons.sunny,color: Colors.orangeAccent,)
        ],
      ),
      body:SingleChildScrollView(child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height:120,
                      width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('Assets/Carpenter/Carpanter.jpeg',fit: BoxFit.fill,),
                    ),
                  ),
                  Positioned(
                    right: 0,
                      bottom: 0,
                    child: Container(
                      height: 35,
                        width: 35,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(Icons.edit,color:Colors.blue,size: 20,),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              BoldText(name: "Mr. Sunny Rohiwal",fontsize: 25),
              PlainText(name: "vebhav@gmail.com", fontsize: 20),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(()=> Edit_Profile());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor,
                  ),
                  child: PlainText(name: "Edit",color: Colors.white, fontsize: 20),
                ),
              ),
           const Divider(),

              SizedBox(
                height: 10,
              ),
              ProfileListWidgets(
                title: "Setting",
                icon: Icons.settings,
                onPressed: (){},
              ),
              ProfileListWidgets(
                title: "Location",
                icon: Icons.location_pin,

                onPressed: (){},
              ),
              ProfileListWidgets(
                title: "Share with friends",
                icon: Icons.share,
                onPressed: (){},
              ),
              ProfileListWidgets(
                title: "About Us",
                icon: Icons.bookmarks_sharp,

                onPressed: (){},
              ),
              ProfileListWidgets(
                title: "Contact-Us",
                icon: Icons.contact_page,
                onPressed: (){},
              ),
              ProfileListWidgets(
                title: "Logout",
                icon: Icons.logout,
                endIcon: false,
                TextColor: Colors.red,
                onPressed: (){},
              ),
            ],
          ),
        )

      ),
    );
  }
}

class ProfileListWidgets extends StatelessWidget {

  const ProfileListWidgets({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    this.TextColor,
    this.endIcon = true,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? TextColor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark? Colors.white : Colors.blue.shade300;
    return ListTile(
      onTap: onPressed,
      leading: Container(
        height: 40,
          width: 40,
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(icon,color: iconColor,),
      ),
      title: PlainText(name:title, fontsize: 22,color: TextColor  ,),
      trailing:endIcon? Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(Icons.arrow_forward_ios),
      ): null,
    );
  }
}
