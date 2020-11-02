class Song {
  final String title;
  final String lyrics;
  final String type;
  final String video;

  Song({this.title, this.lyrics, this.type, this.video});

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      title: json['song_title'],
      lyrics: json['lyrics'],
      type: json['song_type'],
      video: json['video'],
    );
  }
}