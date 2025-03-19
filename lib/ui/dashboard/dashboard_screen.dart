import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:spotify_clone/domain/app_colors.dart';
import 'package:spotify_clone/ui/dashboard/bottombar/Home/home_screen.dart';
import 'package:spotify_clone/ui/dashboard/bottombar/Library/library_screen.dart';
import 'package:spotify_clone/ui/dashboard/bottombar/search/search_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [Homescreen(), SearchScreen(), LibraryScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.blackColor,
        color: AppColors.secondaryBlackColor,
        height: 60.0,
        items: [
          Icon(Icons.home_filled, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.library_music_rounded, size: 30, color: Colors.white),
        ],
        onTap: _onItemTapped,
        index: _selectedIndex,
      ),
    );
  }
}