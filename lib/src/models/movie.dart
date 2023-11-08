import 'classification.dart';

class Movie {
  final String name;
  final Classification classification;
  final String duration;
  final String synopsis;
  final String genre;
  final String? imageURI;
  final List<String> sessions;

  Movie({
    required this.name,
    required this.classification,
    required this.duration,
    required this.synopsis,
    required this.genre,
    required this.imageURI,
    required this.sessions,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      name: map['name'],
      classification: Classification.values.firstWhere((e) => e.classification == map['classification']),
      duration: map['duration'],
      synopsis: map['synopsis'],
      genre: map['genre'],
      imageURI: map['imageURI'],
      sessions: [], // map['sessions'],
    );
  }
}

// Movie.fromJson(Map<String, dynamic> json)
//     : name = json['name'].toString(),
//
//       duration = json['duration'].toString(),
//       synopsis = json['synopsis'].toString(),
//       genre = json['genre'].toString(),
//       image = json['imageURI'].toString() {
//   if (json['sessions'] != null) {
//     final v = json['sessions'];
//     final arr0 = <String>[];
//     v.forEach((v) {
//       arr0.add(v.toString());
//     });
//     sessions = arr0;
