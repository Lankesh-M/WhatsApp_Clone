import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_clone/color.dart';
import 'package:whatsapp_clone/widgets/call_list.dart';
import 'package:whatsapp_clone/widgets/contact_list.dart';
import 'package:whatsapp_clone/widgets/status.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    ContactsList(),
    StatusScreen(),
    Center(child: Text('Community')),
    CallScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: appBarColor,
        appBar: AppBar(
          title: const Text(
            'WhatsApp',
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt),
              color: Colors.grey,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.grey,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              color: Colors.grey,
            ),
          ],

          // bottom: const TabBar(
          //   indicatorColor: tabColor,
          //   indicatorWeight: 4,
          //   labelColor: tabColor,
          //   labelStyle: TextStyle(fontWeight: FontWeight.bold),
          //   tabs: [
          //     Tab(
          //       icon: Icon(
          //         Icons.chat,
          //         size: 25,
          //       ),
          //       child: Text('Chats'),
          //     ),
          //     Tab(
          //       icon: Icon(
          //         Icons.circle_outlined,
          //         size: 25,
          //       ),
          //       child: Text('Status'),
          //     ),
          //     Tab(
          //       icon: Icon(
          //         Icons.call,
          //         size: 25,
          //       ),
          //       child: Text('Calls'),
          //     ),
          //   ],
          // ),
        ),

        body: _widgetOptions.elementAt(_selectedIndex),

        //Bottom Navigation bar New Version of whatsapp
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Calls',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal, fontSize: 10, color: tabColor),
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          selectedItemColor: tabColor,
          unselectedItemColor: tabColor,
          onTap: _onItemTapped,
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text(
                            'Select contact',
                            style: TextStyle(fontSize: 18),
                          ),
                          actions: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search),
                              color: Colors.grey,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert),
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        body: ContactsList())));
          },
          backgroundColor: tabColor,
          child: const Icon(Icons.message_outlined, color: Colors.white),
        ),
      ),
    );
  }
}
