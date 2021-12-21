
import 'dart:convert';

import 'package:movie_app/models/models.dart';

class SearchResponse {
  SearchResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int ?page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  factory SearchResponse.fromJson(String str) => SearchResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchResponse.fromMap(Map<String, dynamic> json) => SearchResponse(
    page: json["page"],
    results: json["results"] == null ? [] : List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toMap() => {
    "page": page,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toMap())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}