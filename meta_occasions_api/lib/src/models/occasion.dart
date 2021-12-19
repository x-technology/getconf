import 'package:json_annotation/json_annotation.dart';

part 'occasion.g.dart';

@JsonSerializable()
class Occasion {
  final String id;
  final String title;
  final String poster;
  final String overview;
  final String url;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final double rating;
  final List<String> tags;

  Occasion(this.id, this.title, this.poster, this.overview, this.url,
      this.startDate, this.endDate, this.location, this.rating, this.tags);

  factory Occasion.fromJson(Map<String, dynamic> json) =>
      _$OccasionFromJson(json);
}
