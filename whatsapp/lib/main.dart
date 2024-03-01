import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/ChatProvider.dart';
import 'package:whatsapp/screens/ChatDetailScreen.dart';
import 'package:whatsapp/widgets/NavigationTabBar.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(11, 20, 27, 1),
          secondaryHeaderColor: const Color.fromRGBO(31, 44, 52, 1),
        ),
        routes: {
          '/' :(context) => const NavigationTabBar(),
          '/chatDetail' : (context) => const ChatDetailScreen(),
        },
        ),
    );
  }
}