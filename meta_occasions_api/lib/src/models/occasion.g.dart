// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'occasion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Occasion _$OccasionFromJson(Map<String, dynamic> json) {
  return $checkedNew('Occasion', json, () {
    final val = Occasion(
      $checkedConvert(json, 'id', (v) => v as String),
      $checkedConvert(json, 'title', (v) => v as String),
      $checkedConvert(json, 'poster', (v) => v as String),
      $checkedConvert(json, 'overview', (v) => v as String),
      $checkedConvert(json, 'url', (v) => v as String),
      $checkedConvert(json, 'start_date', (v) => DateTime.parse(v as String)),
      $checkedConvert(json, 'end_date', (v) => DateTime.parse(v as String)),
      $checkedConvert(json, 'location', (v) => v as String),
      $checkedConvert(json, 'rating', (v) => (v as num).toDouble()),
      $checkedConvert(json, 'tags',
          (v) => (v as List<dynamic>).map((e) => e as String).toList()),
    );
    return val;
  }, fieldKeyMap: const {'startDate': 'start_date', 'endDate': 'end_date'});
}
