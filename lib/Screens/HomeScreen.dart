import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kommunicate_flutter_sample/Constants/constants.dart';
import 'package:kommunicate_flutter_sample/Screens/ConverstationTestScreen.dart';

import '../Widgets/testForm.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userIdController = TextEditingController();
    var userNameController = TextEditingController();
    var passwordController = TextEditingController();

    void loginKommunicate() {

      String userID = userIdController.text.trim();
      String userName = userNameController.text.trim();
      String password = passwordController.text.trim();

      dynamic user = {
      'userId': userID,  //unique userId
      'password': password,   //password is optional
      'appId': AppID.APP_ID
    };

      KommunicateFlutterPlugin.login(user).then((result) {
      print("Login successful : " + result.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) => ConversationListScreen()));
      }).catchError((error) {
      print("Login failed : " + error.toString());
      });
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Kommunicate Sample App"),backgroundColor: Colors.blueAccent,titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormCustom(textEditingController: userIdController, iconData: Icons.nature_outlined,hintText: "UserID",),
          const SizedBox(height: 20,),
          TextFormCustom(textEditingController: userNameController, iconData: Icons.perm_identity_outlined,hintText: "User Name",),
          const SizedBox(height: 20,),
          TextFormCustom(textEditingController: passwordController, iconData: Icons.password,hintText: "Password",isObscured: true,),
          const SizedBox(height: 40,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.indigoAccent
            ),
              onPressed: (){loginKommunicate();},
              child: const Text("Login/Register", style: TextStyle(color: Colors.white),)),
        ],
      ),
      bottomSheet: TransparentBottomSheetContent(),
    );
  }
}

class TransparentBottomSheetContent extends StatelessWidget {
  const TransparentBottomSheetContent({super.key});
  @override
  Widget build(BuildContext context) {

    void loginGuestKommunicate() {
      KommunicateFlutterPlugin.loginAsVisitor(AppID.APP_ID).then((result) {
        print("Login as visitor successful : " + result.toString());
        Navigator.push(context, MaterialPageRoute(builder: (context) => ConversationListScreen()));
      }).catchError((error) {
        print("Login as visitor failed : " + error.toString());
      });
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent, // Set the background color to transparent
      ),
      child: Container(
        color: Colors.grey.shade50,
        alignment: Alignment.center,
        height: 100,
        width: 1000,
        child: GestureDetector(
          onTap: (){loginGuestKommunicate();},
          child: const Text("Don't have account want to login as visitor?"),
        ),
      )
    );
  }
}