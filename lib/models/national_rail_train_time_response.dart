import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'national_rail_train_time_response.g.dart';

@JsonSerializable(explicitToJson: true)
class NationalRailTrainTimeResponse {
  final String std;
  final String etd;
  final String platform;
  final String operator;
  final String operatorCode;
  final String serviceId;
  final String rsid;
  final NationalRailTrainStation origin;
  final NationalRailTrainStation destination;

  NationalRailTrainTimeResponse({
    @required this.std,
    @required this.etd,
    @required this.platform,
    @required this.operator,
    @required this.operatorCode,
    @required this.serviceId,
    @required this.rsid,
    @required this.origin,
    @required this.destination,
  });

  factory NationalRailTrainTimeResponse.fromJson(Map<String, dynamic> json) =>
      _$NationalRailTrainTimeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NationalRailTrainTimeResponseToJson(this);
}

@JsonSerializable()
class NationalRailTrainStation {
  final String name;
  final String crs;

  NationalRailTrainStation({
    @required this.name,
    @required this.crs,
  });

  factory NationalRailTrainStation.fromJson(Map<String, dynamic> json) =>
      _$NationalRailTrainStationFromJson(json);

  factory NationalRailTrainStation.fromList(List list) {
    return NationalRailTrainStation(name: list[0], crs: list[1]);
  }

  Map<String, dynamic> toJson() => _$NationalRailTrainStationToJson(this);
}
