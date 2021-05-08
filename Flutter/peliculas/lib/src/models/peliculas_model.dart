class Peliculas {
  List<Pelicula> items = [];

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList) {
    for (final item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Pelicula({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    id = json['id'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    title = json['title'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  get uniqueIdCard {
    return '$id-tarjeta';
  }

  get uniqueIdBanner {
    return '$id-banner';
  }

  getPosterImg() {
    if (posterPath == null) {
      return 'https://sciences.ucf.edu/puerto-rico-hub/wp-content/uploads/sites/218/2020/04/No-Image-Available.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

  getBackgroundImg() {
    if (backdropPath == null) {
      return 'https://sciences.ucf.edu/puerto-rico-hub/wp-content/uploads/sites/218/2020/04/No-Image-Available.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }
}
