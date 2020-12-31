import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/train_tracker.dart';

class NoJourneyListTile extends StatelessWidget {
  final TrainTracker trainTracker;

  NoJourneyListTile({
    @required this.trainTracker,
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
            subtitle: Text("No Journey Found"),
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
