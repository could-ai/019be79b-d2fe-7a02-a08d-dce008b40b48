import 'package:flutter/material.dart';
import '../models/data_models.dart';
import '../theme/styles.dart';

class PlayerScreen extends StatefulWidget {
  final Song song;
  const PlayerScreen({super.key, required this.song});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool isPlaying = true;
  double sliderValue = 0.3;
  bool isDownloaded = false;

  @override
  void initState() {
    super.initState();
    isDownloaded = widget.song.isDownloaded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Now Playing"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Album Art
            Container(
              height: 320,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  )
                ],
                image: DecorationImage(
                  image: NetworkImage(widget.song.albumArtUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 40),
            
            // Title & Artist
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.song.title, style: AppTextStyles.header),
                    Text(widget.song.artistName, style: AppTextStyles.subHeader.copyWith(color: Colors.grey)),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    isDownloaded ? Icons.download_done : Icons.download_for_offline_outlined,
                    color: isDownloaded ? AppColors.primary : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isDownloaded = !isDownloaded;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(isDownloaded ? "Downloaded for offline listening" : "Removed from downloads")),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Progress Bar
            Slider(
              value: sliderValue,
              activeColor: AppColors.primary,
              inactiveColor: Colors.grey[800],
              onChanged: (v) {
                setState(() {
                  sliderValue = v;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("1:15", style: TextStyle(color: Colors.grey)),
                Text(widget.song.duration, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 20),

            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.shuffle, size: 28),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.skip_previous, size: 36),
                  onPressed: () {},
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, size: 36, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next, size: 36),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.repeat, size: 28),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
