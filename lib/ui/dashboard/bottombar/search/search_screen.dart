import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int? _selectedButtonIndex;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/avatar.png"),
              radius: 24,
            ),
            Text(
              "Search",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_alt_outlined,
                color: AppColors.whiteColor,
                size: 30,
              ),
            ), // camera icon
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // Search Box
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              style: TextStyle(color: AppColors.whiteColor),
            ),
            SizedBox(height: 20),

            // Filter buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterButton("Playlists", 0),
                  SizedBox(width: 10),
                  _buildFilterButton("Podcasts", 1),
                  SizedBox(width: 10),
                  _buildFilterButton("Albums", 2),
                  SizedBox(width: 10),
                  _buildFilterButton("Artists", 3),
                  SizedBox(width: 10),
                ],
              ),
            ),
            SizedBox(height: 20),

            Text(
              "Start browsing",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.greyColor,
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String title, int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedButtonIndex = index;
        });
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Add padding to buttons
        backgroundColor: _selectedButtonIndex == index
            ? AppColors.primaryColor
            : Colors.grey[850] ?? AppColors.greyColor,
        foregroundColor: _selectedButtonIndex == index
            ? AppColors.blackColor
            : AppColors.whiteColor,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: _selectedButtonIndex == index
              ? AppColors.blackColor
              : AppColors.whiteColor,
        ),
      ),
    );
  }
}