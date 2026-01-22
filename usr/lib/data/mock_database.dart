import '../models/data_models.dart';

class MockDatabase {
  static List<String> genres = [
    "All",
    "Kompa",
    "Rap Kreyol",
    "Rabòday",
    "Gospel",
    "Rasin",
    "Zouk",
    "Troubadour"
  ];

  static List<Song> allSongs = [
    Song(
      id: '1',
      title: 'Cheri Benyen m',
      artistName: 'Nu Look',
      albumArtUrl: 'https://placehold.co/400x400/1a1a1a/E53935?text=Nu+Look',
      genre: 'Kompa',
      year: 2023,
      duration: '5:42',
    ),
    Song(
      id: '2',
      title: 'I am Sorry',
      artistName: 'K-Dilak',
      albumArtUrl: 'https://placehold.co/400x400/1a1a1a/1E88E5?text=K-Dilak',
      genre: 'Kompa',
      year: 2022,
      duration: '4:15',
    ),
    Song(
      id: '3',
      title: 'Mwen Renmen w',
      artistName: 'Bedjine',
      albumArtUrl: 'https://placehold.co/400x400/1a1a1a/FFD700?text=Bedjine',
      genre: 'Kompa',
      year: 2024,
      duration: '3:50',
    ),
    Song(
      id: '4',
      title: 'Fè Bagay',
      artistName: 'Tonymix',
      albumArtUrl: 'https://placehold.co/400x400/1a1a1a/ffffff?text=Tonymix',
      genre: 'Rabòday',
      year: 2021,
      duration: '3:10',
    ),
    Song(
      id: '5',
      title: 'Ale Louya',
      artistName: 'Spencer Brutus',
      albumArtUrl: 'https://placehold.co/400x400/1a1a1a/cccccc?text=Gospel',
      genre: 'Gospel',
      year: 2020,
      duration: '6:00',
    ),
    Song(
      id: '6',
      title: 'Kreyol Rap King',
      artistName: 'Wendyyy',
      albumArtUrl: 'https://placehold.co/400x400/1a1a1a/red?text=Wendyyy',
      genre: 'Rap Kreyol',
      year: 2019,
      duration: '3:45',
    ),
    Song(
      id: '7',
      title: 'Lakou Trankil',
      artistName: 'BélO',
      albumArtUrl: 'https://placehold.co/400x400/1a1a1a/green?text=Belo',
      genre: 'Rasin',
      year: 2008,
      duration: '4:20',
    ),
  ];

  static List<Song> getRecommendations() {
    return allSongs.where((s) => s.year >= 2022).toList();
  }

  static List<Song> getByGenre(String genre) {
    if (genre == "All") return allSongs;
    return allSongs.where((s) => s.genre == genre).toList();
  }
}
