import 'package:flutter/material.dart';
import 'package:whatsapp/screens/ChatDetailScreen.dart';

class ChatBox extends StatelessWidget {

  final String personName;
  final String recentChat;
  
  const ChatBox({
    super.key,
    required this.personName,
    required this.recentChat,
  });

  @override
  Widget build(BuildContext context) {

  const textStyle = TextStyle(color: Colors.white);


    return SizedBox(
      width: MediaQuery.of(context).size.height * 1,
      height: MediaQuery.of(context).size.height * 0.1,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(ChatDetailScreen.routeName, arguments: personName);
        },
        child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent 
        ),
          child: Row( 
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/Person.jpg'),
                )
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(personName, style: textStyle,),
                  Text('You : $recentChat', style: textStyle,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}