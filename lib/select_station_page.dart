import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/national_rail_train_time_response.dart';
import 'package:flutter_tutorial/station_utility.dart';

class SelectStationPage extends StatefulWidget {
  @override
  _SelectStationPageState createState() => _SelectStationPageState();
}

class _SelectStationPageState extends State<SelectStationPage> {
  List<NationalRailTrainStation> _currentList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Station"),
      ),
      body: FutureBuilder<List<NationalRailTrainStation>>(
        future: StationUtility.getAllStations(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final originalStations = snapshot.data;

          if (_currentList.isEmpty) {
            _currentList = originalStations;
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        _currentList = originalStations
                            .where((i) =>
                                i.crs.contains(value.toUpperCase()) ||
                                i.name
                                    .toUpperCase()
                                    .contains(value.toUpperCase()))
                            .toList();
                      });
                    } else {
                      setState(() {
                        _currentList = originalStations;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _currentList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        print(_currentList[index].name);
                        Navigator.of(context).pop(_currentList[index]);
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${_currentList[index].name}'),
                          Text(
                            '${_currentList[index].crs}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
