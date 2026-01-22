import 'package:flutter/material.dart';
import '../theme/styles.dart';
import '../models/data_models.dart';
import '../data/mock_database.dart';
import 'player_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedGenre = "All";

  @override
  Widget build(BuildContext context) {
    List<Song> displaySongs = MockDatabase.getByGenre(selectedGenre);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.music_note, color: AppColors.primary),
            const SizedBox(width: 8),
            const Text("KreyolTunes"),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Navigate to search
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Genre Selector
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                itemCount: MockDatabase.genres.length,
                itemBuilder: (context, index) {
                  final genre = MockDatabase.genres[index];
                  final isSelected = genre == selectedGenre;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                      label: Text(genre),
                      selected: isSelected,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedGenre = genre;
                        });
                      },
                      selectedColor: AppColors.primary,
                      backgroundColor: AppColors.surface,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide.none,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Featured / Recommendations
            if (selectedGenre == "All") ...[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Nouvo Mizik (New Releases)", style: AppTextStyles.subHeader),
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: MockDatabase.getRecommendations().length,
                  itemBuilder: (context, index) {
                    final song = MockDatabase.getRecommendations()[index];
                    return GestureDetector(
                      onTap: () => _playSong(context, song),
                      child: Container(
                        width: 140,
                        margin: const EdgeInsets.only(right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(song.albumArtUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              song.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.songTitle,
                            ),
                            Text(
                              song.artistName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.body,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],

            // Song List
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Text(
                "$selectedGenre Hits (2000-2026)", 
                style: AppTextStyles.subHeader
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: displaySongs.length,
              itemBuilder: (context, index) {
                final song = displaySongs[index];
                return ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(song.albumArtUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(song.title, style: AppTextStyles.songTitle),
                  subtitle: Text("${song.artistName} • ${song.year}", style: AppTextStyles.body),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                  onTap: () => _playSong(context, song),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _playSong(BuildContext context, Song song) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlayerScreen(song: song)),
    );
  }
}
