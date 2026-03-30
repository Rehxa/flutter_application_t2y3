class Song {
  final String id;
  final String title;
  final String artistId;
  final Duration duration;
  final Uri imageUrl;
  final int likeAmount;

  Song({
    required this.id,
    required this.title,
    required this.artistId,
    required this.duration,
    required this.imageUrl,
    required this.likeAmount,
  });

  Song copyWith({
    String? title,
    String? artistId,
    Duration? duration,
    Uri? imageUrl,
    int? likeAmount,
  }) => Song(
    id: id,
    title: title ?? this.title,
    artistId: artistId ?? this.artistId,
    duration: duration ?? this.duration,
    imageUrl: imageUrl ?? this.imageUrl,
    likeAmount: likeAmount ?? this.likeAmount,
  );

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artist id: $artistId, duration: $duration)';
  }
}
