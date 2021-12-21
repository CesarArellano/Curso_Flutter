import 'dart:convert';

import 'package:movie_app/models/models.dart';

class MoviesResponse {
  MoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory MoviesResponse.fromJson(String str) => MoviesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MoviesResponse.fromMap(Map<String, dynamic> json) => MoviesResponse(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toMap() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toMap())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}