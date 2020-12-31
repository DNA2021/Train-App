import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_tutorial/create_train_tracker.dart';
import 'package:flutter_tutorial/train_tracker_updating_list_tile.dart';

import 'main.dart';
import 'models/train_tracker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TrainTracker> _trainTrackers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _trainTrackers.length,
        itemBuilder: (context, index) {
          final trainTracker = _trainTrackers[index];
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                _trainTrackers.removeAt(index);
              });

              // Show a snackbar. This snackbar could also contain "Undo" actions.
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                      "${trainTracker.fromStation} to ${trainTracker.toStation} Deleted")));
            },
            background: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            child: TrainTrackerUpdatingListTile(trainTracker: trainTracker),
          );
        },
      ),
      appBar: AppBar(
        title: Text("Anh's Train Times"),
        actions: [
          IconButton(
              icon: Icon(Icons.add_a_photo),
              onPressed: () async {
                const AndroidNotificationDetails
                    androidPlatformChannelSpecifics =
                    AndroidNotificationDetails('your channel id',
                        'your channel name', 'your channel description',
                        importance: Importance.max,
                        priority: Priority.high,
                        showWhen: false);
                const NotificationDetails platformChannelSpecifics =
                    NotificationDetails(
                        android: androidPlatformChannelSpecifics);
                await flutterLocalNotificationsPlugin.show(
                    0, 'plain title', 'plain body', platformChannelSpecifics,
                    payload: 'item x');
              })
        ],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          TrainTracker trainTracker = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateTrainTracker(),
            ),
          );
          if (trainTracker == null) {
            return;
          }

          setState(() {
            _trainTrackers.add(trainTracker);
          });

          print(trainTracker.fromStation + trainTracker.toStation);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
