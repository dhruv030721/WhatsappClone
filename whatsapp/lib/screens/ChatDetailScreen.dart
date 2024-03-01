import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/ChatProvider.dart';

class ChatDetailScreen extends StatelessWidget {
  static const routeName = '/chatDetail';

  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const textstyle = TextStyle(color: Colors.white);
    var personName = ModalRoute.of(context)!.settings.arguments;
    var chat = Provider.of<ChatProvider>(context)
        .chats
        .firstWhere((element) => element.personName == personName);

    print(chat);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          leadingWidth: MediaQuery.of(context).size.width * 0.18,
          leading: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/Person.jpg'),
                  )),
            ],
          ),
          title: Text(
            personName as String,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.020),
          ),
          actions: <Widget>[
            Icon(
              Icons.video_call_rounded,
              color: Colors.white,
              size: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Icon(
              Icons.call,
              color: Colors.white,
              size: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
              size: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: ListView.builder(
              itemCount: chat.chatHistory.length,
              itemBuilder: (context, index) {
                if (chat.chatHistory[index]['sender'] == personName) {
                  return  Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02, bottom: MediaQuery.of(context).size.height * 0.01, right: MediaQuery.of(context).size.width * 0.02),
                            decoration: BoxDecoration(
                              color: Theme.of(context).secondaryHeaderColor,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.03, vertical: MediaQuery.of(context).size.height * 0.01),
                            child: Text(
                              chat.chatHistory[index]['message'],
                              style: textstyle.copyWith(backgroundColor: Theme.of(context).secondaryHeaderColor),
                            ),
                          ),
                        ]
                  );
                } else {
                  return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01,bottom: MediaQuery.of(context).size.height * 0.02, left: MediaQuery.of(context).size.width * 0.02),
                            decoration: BoxDecoration(
                              color: Theme.of(context).secondaryHeaderColor,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.03, vertical: MediaQuery.of(context).size.height * 0.01),
                            child: Text(
                              chat.chatHistory[index]['message'],
                              style: textstyle.copyWith(backgroundColor: Theme.of(context).secondaryHeaderColor),
                            ),
                          ),
                        ]
                  );
                }
              }),
        ));
  }
}
