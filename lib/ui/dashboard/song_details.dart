import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/app_colors.dart';

class SongDetailScreen extends StatefulWidget {
  final String songName;
  final String imagePath;

  const SongDetailScreen({
    super.key,
    required this.songName,
    required this.imagePath,
  });

  @override
  _SongDetailScreenState createState() => _SongDetailScreenState();
}

class _SongDetailScreenState extends State<SongDetailScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  double _sliderValue = 0.0;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  final String _audioPath = "assets/audio/Alegend - Imagination.mp3"; // 🎵 Audio file path

  @override
  void initState() {
    super.initState();

    // Set audio source
    _audioPlayer.setSourceAsset(_audioPath);

    // Listen for duration updates
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });

    // Listen for position updates
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
        if (_duration.inSeconds > 0) {
          _sliderValue = position.inSeconds.toDouble() / _duration.inSeconds.toDouble();
        }
      });
    });
  }

  Future<void> _playPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource(_audioPath));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _onSliderChanged(double value) {
    setState(() {
      _sliderValue = value;
    });
    final newPosition = Duration(seconds: (value * _duration.inSeconds).toInt());
    _audioPlayer.seek(newPosition);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // Blurred Background Image
          Positioned.fill(
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
            ),
          ),

          // Overlay for better visibility
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black87, Colors.black54, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Album Artwork
              Hero(
                tag: widget.songName,
                child: Container(
                  height: screenHeight * 0.45,
                  width: screenWidth * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Song Title
              Text(
                widget.songName,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                "Artist Name",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),

              const SizedBox(height: 20),

              // Progress Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Column(
                  children: [
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 4,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
                      ),
                      child: Slider(
                        value: _sliderValue,
                        onChanged: _onSliderChanged,
                        min: 0,
                        max: 1,
                        activeColor: AppColors.primaryColor,
                        inactiveColor: Colors.white24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatDuration(_position),
                          style: const TextStyle(color: Colors.white54),
                        ),
                        Text(
                          _formatDuration(_duration),
                          style: const TextStyle(color: Colors.white54),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Music Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _controlButton(Icons.skip_previous, () {
                    // Handle previous song
                  }),
                  const SizedBox(width: 20),
                  _playPauseButton(),
                  const SizedBox(width: 20),
                  _controlButton(Icons.skip_next, () {
                    // Handle next song
                  }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🟢 Play / Pause Button
  Widget _playPauseButton() {
    return GestureDetector(
      onTap: _playPause,
      child: Container(
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          _isPlaying ? Icons.pause : Icons.play_arrow,
          color: AppColors.blackColor,
          size: 40,
        ),
      ),
    );
  }

  // 🔘 Other Control Buttons
  Widget _controlButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon, color: Colors.white, size: 40),
      onPressed: onPressed,
    );
  }

  // ⏳ Format Duration (MM:SS)
  String _formatDuration(Duration duration) {
    String minutes = duration.inMinutes.toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
}
