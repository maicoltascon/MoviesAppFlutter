import 'dart:convert';

class Movie {
    bool adult;
    String? backdropPath;
    List<int> genreIds;
    int id;
    String originalLanguage;
    String? originalTitle;
    String? originalName;
    String overview;
    double popularity;
    String? posterPath;
    DateTime? releaseDate;
    String title;
    String name;
    bool? video;
    double? voteAverage;
    int? voteCount;

    get fullPosterImg {
      if (posterPath != null) {
        return 'https://image.tmdb.org/t/p/w500$posterPath';
      }
      return 'https://i.stack.imgur.com/GNhxO.png';
    }

    Movie({
        required this.adult,
        this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalLanguage,
        this.originalTitle,
        this.originalName,
        required this.overview,
        required this.popularity,
        this.posterPath,
        this.releaseDate,
        required this.title,
        required this.name,

        this.video,
        this.voteAverage,
        this.voteCount,
    });

    factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"] ?? json["original_name"],
        originalName: json["original_name"] ?? '',
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        title: json["title"] ?? json["name"],
        name: json["name"] ?? '',
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
