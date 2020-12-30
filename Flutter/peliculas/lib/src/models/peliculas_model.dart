class Peliculas {
  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (final item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

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
  getPosterImg() {
    if (posterPath == null) {
      return 'https://lh3.googleusercontent.com/proxy/KWdNklUt2IHDhW2wii67Sz_RXO5M8J3F_z11hDjdRphlQpBtDtu_V1yXR2JdH8-UzyuvvIiuqEpgQ5DyNh6GhGUfFBl_wX8ITZOUg-vDXG8cIHnPRi9HSzZacsfKtwxVEwjK7mUKP2Zg2vk-4tm-5QUS9Ls59ddwpsXDj0pUsA781ZbBshxm782CUJEDwcwl5A1rX0HLU4k3uyzRNNS_iDQqmk0qyJQ13Ym7b2dSOS5c1LBCRDsWmSw1Rzh5NpkBRJMMrJugegnN7UCaX5kaLY4eLOAGX_pl3fdLzXBo0HYslPSRcEeBXXnnYnzNetalqkrH7rIwhTut52_QyNy4ym-039dJSex1mYUssFNrUO_efeKAGBDSA12shh5DjMK-mgyoMrqi5wpaAWg00-Mdm3E7WCrzOQHd-37zA006EskrC1M1HM3VH2efbaq-POlrn6W1x3qYRHrS-OWY1dwC1wHeL0Vxu3uDXDpsgxeOd__JZvwHiy_U-VP7_X18WewXUjzFITrVsPSAtnuIqajGkXLUuUbd_3w7EKWGzsEyFiVUJzsdZlMXklEpnTaQmPFxIu-FdeY';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

  getBackgroundImg() {
    if (posterPath == null) {
      return 'https://lh3.googleusercontent.com/proxy/KWdNklUt2IHDhW2wii67Sz_RXO5M8J3F_z11hDjdRphlQpBtDtu_V1yXR2JdH8-UzyuvvIiuqEpgQ5DyNh6GhGUfFBl_wX8ITZOUg-vDXG8cIHnPRi9HSzZacsfKtwxVEwjK7mUKP2Zg2vk-4tm-5QUS9Ls59ddwpsXDj0pUsA781ZbBshxm782CUJEDwcwl5A1rX0HLU4k3uyzRNNS_iDQqmk0qyJQ13Ym7b2dSOS5c1LBCRDsWmSw1Rzh5NpkBRJMMrJugegnN7UCaX5kaLY4eLOAGX_pl3fdLzXBo0HYslPSRcEeBXXnnYnzNetalqkrH7rIwhTut52_QyNy4ym-039dJSex1mYUssFNrUO_efeKAGBDSA12shh5DjMK-mgyoMrqi5wpaAWg00-Mdm3E7WCrzOQHd-37zA006EskrC1M1HM3VH2efbaq-POlrn6W1x3qYRHrS-OWY1dwC1wHeL0Vxu3uDXDpsgxeOd__JZvwHiy_U-VP7_X18WewXUjzFITrVsPSAtnuIqajGkXLUuUbd_3w7EKWGzsEyFiVUJzsdZlMXklEpnTaQmPFxIu-FdeY';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }
}
