import 'package:aunproject1/Insta/profile.dart';
import 'package:aunproject1/Insta/reels_Screen.dart';
import 'package:aunproject1/Insta/search_screen.dart';
import 'package:flutter/material.dart';

import '../FIreBase/home_screen.dart';



class InstagramClone extends StatefulWidget {
  const InstagramClone({Key? key}) : super(key: key);

  @override
  State<InstagramClone> createState() => _InstagramCloneState();
}

class _InstagramCloneState extends State<InstagramClone> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const ReelsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage(''),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}