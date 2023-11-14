class GenresResponse {
  String? success;
  int? status_code;
  String? status_message;
  List<Genres>? genres;
  GenresResponse({
      this.genres,
      this.status_code,
      this.status_message,
      this.success});

  GenresResponse.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    status_message = json['status_message'];
    success = json['success'];
    status_code = json['status_code'];
  }

}

class Genres {
  int? id;
  String? name;

  Genres({
      this.id,
      this.name,
  });

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }


}