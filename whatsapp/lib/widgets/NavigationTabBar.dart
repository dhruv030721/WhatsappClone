import 'package:flutter/material.dart';
import 'package:whatsapp/screens/CallsScreen.dart';
import 'package:whatsapp/screens/ChatScreen.dart';
import 'package:whatsapp/screens/CommunitiesScreen.dart';
import 'package:whatsapp/screens/UpdatesScreen.dart';

class NavigationTabBar extends StatefulWidget {
  const NavigationTabBar({Key? key}) : super(key: key);

  @override
  State<NavigationTabBar> createState() => _NavigationTabBarState();
}

class _NavigationTabBarState extends State<NavigationTabBar> {
  late List<Widget> _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      const ChatScreen(),
      const UpdatesScreen(),
      const CommunitiesScreen(),
      const CallScreen(),
    ];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Text(
          'WhatsApp',
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height * 0.03),
        ),
        actions: <Widget>[
          Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
            size: MediaQuery.of(context).size.height * 0.03,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Icon(
            Icons.search,
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
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromRGBO(38, 211, 103, 1),
        child: const Icon(Icons.add_comment_rounded , color: Colors.black,),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).secondaryHeaderColor),
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                label: "Chats"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.update_sharp,
                  color: Colors.white,
                ),
                label: "Updates"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.group,
                  color: Colors.white,
                ),
                label: "Communities"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                label: "Calls"),
          ],
        ),
      ),
    );
  }
}
