import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta_occasions_api/meta_occasions_api.dart';

class OccasionRequestFailure implements Exception {}

class OccasionNotFoundFailure implements Exception {}

class MetaOccasionApiClient {
  /// {@macro meta_occasion_api_client}
  MetaOccasionApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'localhost:3001';
  static const _token = 'test';
  final http.Client _httpClient;

  /// Fetches [Occasion] for a given [occasionId].
  Future<Occasion> getOccasion(int occasionId) async {
    final occasionRequest = Uri.https(_baseUrl, '/occasions/$occasionId');
    final occasionResponse = await _httpClient.get(occasionRequest);

    if (occasionResponse.statusCode != 200) {
      throw OccasionRequestFailure();
    }

    final bodyJson = jsonDecode(occasionResponse.body) as Map<String, dynamic>;

    if (bodyJson.isEmpty) {
      throw OccasionNotFoundFailure();
    }

    final occasionJson = bodyJson['results'] as List; // TODO change to "value"

    if (occasionJson.isEmpty) {
      throw OccasionNotFoundFailure();
    }

    return Occasion.fromJson(occasionJson as Map<String, dynamic>);
  }

  Future<List<Occasion>> getOccasions() async {
    final occasionsRequest = Uri.https(_baseUrl, '/occasions');
    final occasionsResponse = await _httpClient.get(occasionsRequest);

    if (occasionsResponse.statusCode != 200) {
      throw OcassionsListRequestFailure();
    }

    final bodyJson = jsonDecode(occasionsResponse.body) as Map<String, dynamic>;

    final occasionsJson = bodyJson['results'] as List; // TODO change to "value"

    return occasionsJson.map((i) => new Occasion.fromJson(i)).toList();
  }
}

class OcassionsListRequestFailure implements Exception {}
