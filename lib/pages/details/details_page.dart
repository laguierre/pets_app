import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/models.dart';
import 'details_page_widgets.dart';


class DetailsPage extends StatelessWidget {
  const DetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int index = Provider.of<AnimalSelectedModel>(context).number;
    double heightAnimalInfo = 150.0;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.blueGrey[300],
                    ),
                  ),
                  OwnerDescription(heightAnimalInfo: heightAnimalInfo, size: size)
                ],
              )),
          AnimalImage(size: size, index: index),
          AnimalInfo(
            index: index,
            height: heightAnimalInfo,
          ),
          TopBottom(),
          ButtonBottom(size: size),
        ],
      ),
    );
  }
}
