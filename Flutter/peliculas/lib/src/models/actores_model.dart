class Cast {
  List<Actor> actores = [];
  Cast.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final actor = Actor.fromJsonMap(item);
      actores.add(actor);
    }
  }
}

class Actor {
  int? gender;
  int? id;
  String? name;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;

  Actor({
    this.gender,
    this.id,
    this.name,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_Id'];
    order = json['order'];
  }

  getFoto() {
    if (profilePath == null) {
      return 'https://mpw.bangsamoro.gov.ph/wp-content/uploads/2019/04/Noavatar.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}
