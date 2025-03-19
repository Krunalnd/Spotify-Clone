import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/app_colors.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedButtonIndex = 0; // Default selected index

  final List<Map<String, String>> songs = [
    {"name": "Afterburner", "image": "assets/image/Afterburner.png"},
    {
      "name": "Anthem of the Peaceful Army",
      "image": "assets/image/Anthem of the Peaceful Army.png"
    },
    {"name": "Bryce Vine", "image": "assets/image/Bryce Vine.png"},
    {
      "name": "Dance Gavin Dance",
      "image": "assets/image/Dance Gavin Dance - Members.png"
    },
    {"name": "From the Fires", "image": "assets/image/From the Fires.png"},
    {"name": "Members", "image": "assets/image/Members.png"},
    {"name": "MGK", "image": "assets/image/MGK.png"},
    {"name": "Mothership", "image": "assets/image/Mothership.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(backgroundColor: AppColors.blackColor),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildFilterButtons(),
            const SizedBox(height: 20),
            _buildContentGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage("assets/avatar.png"),
        ),
        Expanded(
          child: Text(
            "Welcome Back!",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            // TODO: Implement notifications
          },
        ),
      ],
    );
  }

  Widget _buildFilterButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFilterButton("All", 0),
        _buildFilterButton("Music", 1),
        _buildFilterButton("Podcasts", 2),
      ],
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
        backgroundColor: _selectedButtonIndex == index
            ? AppColors.primaryColor
            : Colors.grey[850] ?? AppColors.greyColor,
        foregroundColor: _selectedButtonIndex == index
            ? AppColors.blackColor
            : AppColors.whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(title, style: const TextStyle(fontSize: 16)),
    );
  }

  Widget _buildContentGrid() {
    int columns = (MediaQuery.of(context).size.width / 180).floor();
    columns = columns > 0 ? columns : 1; // Ensure at least 1 column

    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75, // Slightly adjusted for better spacing
        ),
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return _buildContentCard(
            songs[index]["name"]!,
            songs[index]["image"]!,
          );
        },
      ),
    );
  }

  Widget _buildContentCard(String title, String imagePath) {
    return Card(
      color: AppColors.greyColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 6,
      child: Stack(
        children: [
          // Background Image covering the full container
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[800],
                    child: const Icon(Icons.image_not_supported,
                        color: Colors.white70, size: 40),
                  );
                },
              ),
            ),
          ),

          // Gradient Overlay for readability
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [Colors.black87, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),

          // Centered Song Title with proper spacing
          Positioned.fill(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          blurRadius: 5.0,
                          color: Colors.black54,
                          offset: Offset(0, 1)),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
