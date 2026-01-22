class Song {
  final String id;
  final String title;
  final String artistName;
  final String albumArtUrl;
  final String genre;
  final int year;
  final String duration;
  bool isDownloaded;

  Song({
    required this.id,
    required this.title,
    required this.artistName,
    required this.albumArtUrl,
    required this.genre,
    required this.year,
    required this.duration,
    this.isDownloaded = false,
  });
}

class Artist {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> genres;

  Artist({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.genres,
  });
}

class Playlist {
  final String id;
  final String title;
  final String coverUrl;
  final List<Song> songs;

  Playlist({
    required this.id,
    required this.title,
    required this.coverUrl,
    required this.songs,
  });
}
