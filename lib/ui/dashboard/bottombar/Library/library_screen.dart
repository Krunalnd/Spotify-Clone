import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/app_colors.dart';
import 'package:spotify_clone/ui/dashboard/song_details.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int? _selectedButtonIndex;

  final List<Map<String, String>> songs = [
    {"name": "Afterburner", "image": "assets/image/Afterburner.png"},
    {"name": "Anthem of the Peaceful Army", "image": "assets/image/Anthem of the Peaceful Army.png"},
    {"name": "Bryce Vine", "image": "assets/image/Bryce Vine.png"},
    {"name": "Dance Gavin Dance - Members", "image": "assets/image/Dance Gavin Dance - Members.png"},
    {"name": "From the Fires", "image": "assets/image/From the Fires.png"},
    {"name": "Members", "image": "assets/image/Members.png"},
    {"name": "MGK", "image": "assets/image/MGK.png"},
    {"name": "Mothership", "image": "assets/image/Mothership.png"},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bool isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/avatar.png"),
              radius: 24,
            ),
            const Text(
              "Your Library",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.02),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildFilterButton("Playlists", 0),
                buildFilterButton("Podcasts", 1),
                buildFilterButton("Albums", 2),
                buildFilterButton("Artists", 3),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(
                  songName: songs[index]["name"]!,
                  imagePath: songs[index]["image"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilterButton(String title, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedButtonIndex = index;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _selectedButtonIndex == index
              ? AppColors.primaryColor
              : Colors.grey[850],
          foregroundColor: _selectedButtonIndex == index
              ? AppColors.blackColor
              : AppColors.whiteColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class SongCard extends StatelessWidget {
  final String songName;
  final String imagePath;

  const SongCard({super.key, required this.songName, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SongDetailScreen(songName: songName, imagePath: imagePath),
          ),
        );
      },
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
          ),
          title: Text(songName, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          trailing: const Icon(Icons.more_vert, color: Colors.white),
        ),
      ),
    );
  }
}