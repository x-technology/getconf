import 'package:get_conf/model/occasion_response.dart';
import 'package:get_conf/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class OccasionListBloc {
  final OccasionRepository _occasionsRepository = OccasionRepository();
  final BehaviorSubject<OccasionResponse> _subject =
      BehaviorSubject<OccasionResponse>();

  getOccasions() async {
    OccasionResponse response = await _occasionsRepository.getOccasions();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<OccasionResponse> get subject => _subject;
}

final occasionsBloc = OccasionListBloc();
