import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  int imgurl;
  String title;
  int price;
  BuildContext context;
  DetailsPage(this.imgurl, this.title, this.price,this.context);

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text(title),
        Text('$imgurl')
      ],
      ),
    );
  }
}
