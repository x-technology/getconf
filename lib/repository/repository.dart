import 'package:get_conf/model/occasion_response.dart';
import 'package:dio/dio.dart';

class EventRepository {
  final String apiKey = "Test";
  static String mainUrl = "https://localhost:3001/";

  final Dio _dio = Dio();
  var getOccasionsUrl = '$mainUrl/occasions';

  Future<OccasionResponse> getOccasions() async {
    var params = {'api_key': apiKey, 'language': 'en-US', 'page': 1};

    try {
      Response response =
          await _dio.get(getOccasionsUrl, queryParameters: params);
      return OccasionResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OccasionResponse.withError("$error");
    }
  }
}
