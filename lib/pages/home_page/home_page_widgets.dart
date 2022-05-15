import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../configuration.dart';
import '../../models/models.dart';

class IconAnimalCategory extends StatelessWidget {
  const IconAnimalCategory({
    Key key,
    @required this.petCategory,
    @required this.index,
  }) : super(key: key);

  final int petCategory;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: petCategory == index ? primaryGreen : Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    blurRadius: 5,
                    offset: Offset(0, 3))
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Image.asset(
            categories[index]['iconPath'],
            height: 50,
            width: 50,
            color: petCategory == index ? Colors.white : Colors.grey,
          ),
        ),
        SizedBox(height: 5),
        Text(
          categories[index]['name'],
          style: TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class PetDescription extends StatelessWidget {
  const PetDescription({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    List<Map> categoryList =
        Provider.of<AnimalSelectedModel>(context).categoryList;
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[300],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: shadowList,
                  ),
                  height: size.height * 0.27,
                  //margin: EdgeInsets.only(top: 40),
                ),
                Image.asset(
                  categoryList[index]['image'],
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.only(top: 50, bottom: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: shadowList,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        categoryList[index]['name'],
                        minFontSize: 18,
                        maxFontSize: 26,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.black54,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Spacer(),
                    Icon(
                        !categoryList[index]['male']
                            ? FontAwesomeIcons.mars
                            : FontAwesomeIcons.venus,
                        color: Colors.black54)
                  ],
                ),
                Text(
                  categoryList[index]['race'],
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  categoryList[index]['years'],
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: primaryGreen),
                    SizedBox(width: 2),
                    Expanded(
                      child: AutoSizeText(
                        categoryList[index]['distance'],
                        minFontSize: 1,
                        maxFontSize: 14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
