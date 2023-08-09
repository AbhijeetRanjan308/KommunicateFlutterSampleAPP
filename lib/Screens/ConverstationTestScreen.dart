import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:kommunicate_flutter_sample/Constants/constants.dart';

class ConversationListScreen extends StatelessWidget {
  const ConversationListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    void logoutUser(){
      KommunicateFlutterPlugin.logout();
      Navigator.pop(context);
    }

    void openConversations() {
      KommunicateFlutterPlugin.openConversations();
    }

    void createNewConversation() {
      dynamic conversationObject = {
      'appId': AppID.APP_ID,
      'isSingleConversation' : false
      };

      KommunicateFlutterPlugin.buildConversation(conversationObject)
          .then((result) {
      print("Conversation builder success: " + result.toString());  //result.toString() will be the clientChannelKey
      }).catchError((error) {
      print("Conversation builder error occurred : " + error.toString());
      });
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Kommunicate Conversation"),backgroundColor: Colors.blueAccent,titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),automaticallyImplyLeading: false,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.indigoAccent
                  ),
                  onPressed: (){openConversations();},
                  child: const Text("Show Conversation List", style: TextStyle(color: Colors.white),)),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.indigoAccent
                  ),
                  onPressed: (){createNewConversation();},
                  child: const Text("Create New Conversation", style: TextStyle(color: Colors.white),)),
            ),
            const SizedBox(height: 40,),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigoAccent
                ),
                onPressed: (){logoutUser();},
                child: const Text("Log Out", style: TextStyle(color: Colors.white),)),
          ],
        ),
      ),
    );
  }
}
