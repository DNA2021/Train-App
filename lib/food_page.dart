import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  final String title;

  FoodPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Text('dfgsdfgsdfgsdfsdf'),
    );
  }
}
