import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/screens/more_screen.dart';
import 'package:netflix_clone/screens/search_screen.dart';
import 'package:netflix_clone/screens/settings_screen.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return   DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: TabBar(tabs: [
            Tab(icon: Icon(Icons.home),
            text: 'Home',
            ),
            Tab(icon: Icon(Icons.search),
            text: 'Search',
            ),
            Tab(icon: Icon(Icons.photo_library_outlined),
            text: 'New & Hot',
            ),
             Tab(icon: Icon(Icons.settings),
            text: 'Settings',
            ),
          ],
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Color(0xff999999),
          ),
        ),
        body: TabBarView(children: [
          HomeScreen(),
          SearchScreen(),
          MoreScreen(),
          SettingsScreen(),

        ]),
      ),

    );
  }
}