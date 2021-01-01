import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'train_tracker.g.dart';

@JsonSerializable(explicitToJson: true)
class TrainTracker {
  final String fromStation;
  final String toStation;

  TrainTracker({@required this.fromStation, @required this.toStation});

  factory TrainTracker.fromJson(Map<String, dynamic> json) =>
      _$TrainTrackerFromJson(json);

  factory TrainTracker.fromJsonString(String jsonString) {
    final json = jsonDecode(jsonString);
    return _$TrainTrackerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TrainTrackerToJson(this);

  String toJsonString() {
    final json = toJson();

    return jsonEncode(json);
  }
}
