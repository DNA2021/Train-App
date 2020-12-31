import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial/models/national_rail_train_time_response.dart';

class StationUtility {
  static Future<List<NationalRailTrainStation>> getAllStations() async {
    final csvData = await rootBundle.loadString('assets/stations.csv');

    List<NationalRailTrainStation> stations = const CsvToListConverter()
        .convert(csvData)
        .map((raw) => NationalRailTrainStation.fromList(raw))
        .toList();

    return stations;
  }
}
