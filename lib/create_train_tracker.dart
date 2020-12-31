import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/national_rail_train_time_response.dart';
import 'package:flutter_tutorial/models/train_tracker.dart';
import 'package:flutter_tutorial/select_station_page.dart';

class CreateTrainTracker extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _fromStationController = TextEditingController();
  final _toStationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onTap: () async {
                      NationalRailTrainStation trainStation =
                          await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SelectStationPage(),
                          fullscreenDialog: true,
                        ),
                      );
                      if (trainStation == null) {
                        return;
                      }
                      _fromStationController.text = trainStation.crs;
                    },
                    controller: _fromStationController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter the train station";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "From Station😂",
                      icon: Icon(Icons.train_outlined),
                      hintText: "Departure Station",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onTap: () async {
                      NationalRailTrainStation trainStation =
                          await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SelectStationPage(),
                          fullscreenDialog: true,
                        ),
                      );
                      if (trainStation == null) {
                        return;
                      }
                      _toStationController.text = trainStation.crs;
                    },
                    controller: _toStationController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter the train station";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "To Station",
                      icon: Icon(Icons.train_outlined),
                      hintText: "Destination Station",
                    ),
                  ),
                ),
              ],
            ),
            OutlinedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  final trainTracker = TrainTracker(
                    fromStation: _fromStationController.text,
                    toStation: _toStationController.text,
                  );

                  Navigator.of(context).pop(trainTracker);
                }
              },
              child: Text("Add"),
            )
          ],
        ),
      ),
    );
  }
}
