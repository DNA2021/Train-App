import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/national_rail_train_time_response.dart';
import 'package:flutter_tutorial/no_journey_list_tile.dart';
import 'package:flutter_tutorial/train_tracker_list_tile.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

import 'models/train_tracker.dart';

class TrainTrackerUpdatingListTile extends StatefulWidget {
  final TrainTracker trainTracker;
  TrainTrackerUpdatingListTile({@required this.trainTracker});
  @override
  _TrainTrackerUpdatingListTileState createState() =>
      _TrainTrackerUpdatingListTileState();
}

class _TrainTrackerUpdatingListTileState
    extends State<TrainTrackerUpdatingListTile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Response>(
        future: http.get(
            "https://pollen-chisel-nephew.glitch.me/departure-board/${widget.trainTracker.fromStation}?destination=${widget.trainTracker.toStation}"),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          dynamic response = jsonDecode(snapshot.data.body);
          List<dynamic> trainTimes = response['trainServices'];
          final nationalRailResponses = trainTimes
              .map((trainTime) =>
                  NationalRailTrainTimeResponse.fromJson(trainTime))
              .toList();
          print(snapshot.data);

          if (nationalRailResponses.isEmpty) {
            return NoJourneyListTile(trainTracker: widget.trainTracker);
          }
          return TrainTrackerListTile(
            nationalRailTrainTimeResponse: nationalRailResponses[0],
            trainTracker: widget.trainTracker,
          );
        });
  }
}
