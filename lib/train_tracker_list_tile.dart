import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/national_rail_train_time_response.dart';
import 'package:flutter_tutorial/models/train_tracker.dart';

class TrainTrackerListTile extends StatelessWidget {
  final TrainTracker trainTracker;
  final NationalRailTrainTimeResponse nationalRailTrainTimeResponse;

  TrainTrackerListTile({
    @required this.trainTracker,
    @required this.nationalRailTrainTimeResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.train_sharp),
            title: Text(
                "${trainTracker.fromStation} to ${trainTracker.toStation}"),
            subtitle: Text(
                "${nationalRailTrainTimeResponse.etd} - ${nationalRailTrainTimeResponse.std}"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('Set Reminder'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
