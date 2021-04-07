import 'package:get_conf/model/occasion.dart';

class OccasionResponse {
  final List<Occasion> occasions;
  final String error;
  OccasionResponse(this.occasions, this.error);

  OccasionResponse.fromJson(Map<String, dynamic> json)
      : occasions = (json["results"] as List)
            .map((i) => new Occasion.fromJson(i))
            .toList(),
        error = "";

  OccasionResponse.withError(String errorValue)
      : occasions = [],
        error = errorValue;
}
