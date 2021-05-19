class Occasion {
  final String id;
  final String title;
  final String poster;
  final String overview;
  final String url;
  final DateTime datetime;
  final String location;
  final double rating;

  Occasion(this.id, this.title, this.poster, this.overview, this.url,
      this.datetime, this.location, this.rating);

  Occasion.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        poster = json["poster_path"],
        overview = json["overview"],
        url = json["url"],
        location = json["location"],
        datetime = DateTime.parse(json["datetime"]),
        rating = json["rating"].toDouble();

  @override
  String toString() => title;
}
