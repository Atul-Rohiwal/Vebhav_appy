import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Views/Home.dart';
import '../Common/Bold_Text.dart';
import '../Common/Constant.dart';
import '../Common/Plain_text.dart';
import '../Common/Utiels.dart';
import '../Providers/User.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  var passwordController  = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  FocusNode emailFocusNode  = FocusNode();
  FocusNode passwordFocusnode = FocusNode();
  FocusNode nameFocusNode = FocusNode();

  bool _validate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
              child:Form(
                key: _formKey,
                child:Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      BoldText(name: "Welcome to ...", fontsize: 25,color: appColor,),
                      SizedBox(
                        height: 20,
                      ),
                      BoldText(name: "Sign-Up", fontsize: 25),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          focusNode: nameFocusNode,
                          controller: nameController,
                          decoration: InputDecoration(
                              prefixIcon:Icon(Icons.person),
                              hintText: 'Enter your Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)
                              )
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Name';
                            } else if (value!.length<3) {
                              return 'Please Enter valid name';
                            }
                            return null;
                          },
                          onFieldSubmitted: (valu){
                            Utiels.fieldFocusChange(context, nameFocusNode, emailFocusNode);
                          }
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        focusNode: emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                            prefixIcon:Icon(Icons.email),
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                            )
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!value.contains('@')) {
                            return 'Email must contain @ symbol';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value){
                          Utiels.fieldFocusChange(context,emailFocusNode, passwordFocusnode);
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ValueListenableBuilder(valueListenable: _obsecurePassword,
                          builder: (context, value, child){
                            return TextFormField(
                              controller:passwordController,
                              focusNode: passwordFocusnode,
                              obscureText: _obsecurePassword.value,
                              obscuringCharacter: '*',
                              decoration: InputDecoration(
                                border:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                hintText: "Password",
                                label: Text('Password'),
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon:InkWell(
                                    onTap: (){
                                      _obsecurePassword.value = !_obsecurePassword.value;},
                                    child: Icon(
                                      _obsecurePassword.value ? Icons.visibility_off_outlined : Icons.visibility,
                                    )
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.length < 8) {
                                  return 'Password must be at least 8 characters long';
                                } else if (value.indexOf('1234') == -1) {
                                  return 'Password must contain the digits "1234"';
                                }
                                return null;
                              },
                            );
                          }
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: appColor,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: TextButton(onPressed: (){
                          if (_formKey.currentState?.validate() == true) {
                            Provider.of<User>(context, listen: false).signup(
                              emailController.text.toString(),
                              passwordController.text.toString(),
                              nameController.text.toString(),
                            );
                            Get.to(() => Dashboard());
                          }
                        }, child: Center(
                          child: Text("Login"),
                        )),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          PlainText(name: 'Do you have account ? ', fontsize: 20),
                          TextButton(onPressed: () {
                            Get.to(() => Dashboard());
                          },
                            child: PlainText(fontsize: 20,name:"Home"),
                          ),
                        ],
                      ),

                    ],
                    mainAxisAlignment:MainAxisAlignment.center
                ),

              )
          ),
        ),
      ),
    );
  }
}