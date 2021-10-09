class Movie {
  final String name;
  final String thumbnail;
  final String uploadBy;
  Movie({
    required this.name,
    required this.thumbnail,
    required this.uploadBy,
  });

  @override
  String toString() {
    return 'Movie(name: $name, thumbnail: $thumbnail, uploadBy: $uploadBy)';
  }
}
