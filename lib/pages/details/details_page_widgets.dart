import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../configuration.dart';
import '../../models/models.dart';

class ButtonBottom extends StatelessWidget {
  const ButtonBottom({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    double sizeButtons = 60;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * 0.15,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: sizeButtons,
              width: sizeButtons+20,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: primaryGreen,
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Container(
                padding: EdgeInsets.only(left: 50, right: 50),
                height: sizeButtons,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: primaryGreen,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'Adoption',
                    style:
                    TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )),
      ),
    );
  }
}


class TopBottom extends StatelessWidget {
  const TopBottom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, right: 10, left: 5),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Color(0xFF636567),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            IconButton(
                icon: Icon(
                  CupertinoIcons.share,
                  size: 30,
                  color: Color(0xFF636567),
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}


class OwnerDescription extends StatelessWidget {
  const OwnerDescription({
    Key key,
    @required this.heightAnimalInfo,
    @required this.size,
  }) : super(key: key);

  final double heightAnimalInfo;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          margin: EdgeInsets.only(
              top: heightAnimalInfo / 2 + 20,
              bottom: size.height * 0.15), //
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?u=a042581f4e29026704d'),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 10),
                  RichText(
                      text: TextSpan(
                          text: 'Maya Berkovskaya',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: '\nOwner',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                    fontSize: 14))
                          ])),
                  Spacer(),
                  Text(
                    'May 8, 2022',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black54),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                dummyText,
                maxLines: 4,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimalInfo extends StatelessWidget {
  const AnimalInfo({
    Key key,
    @required this.index,
    @required this.height,
  }) : super(key: key);

  final int index;
  final double height;

  @override
  Widget build(BuildContext context) {
    List<Map> categoryList = Provider
        .of<AnimalSelectedModel>(context).categoryList;
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: height,
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: shadowList,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(
                  categoryList[index]['name'],
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Icon(
                    categoryList[index]['male']
                        ? FontAwesomeIcons.venus
                        : FontAwesomeIcons.mars,
                    color: Colors.black54)
              ],
            ),
            Row(
              children: [
                Text(
                  categoryList[index]['race'],
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text(
                  categoryList[index]['years'],
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: primaryGreen),
                Text(
                  CatsList[index]['distance'],
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnimalImage extends StatelessWidget {
  const AnimalImage({
    Key key,
    @required this.size,
    @required this.index,
  }) : super(key: key);

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    List<Map> categoryList = Provider
        .of<AnimalSelectedModel>(context).categoryList;
    return Container(
      alignment: Alignment.bottomCenter,
      height: size.height * 0.4,
      width: size.width,
      margin: EdgeInsets.only(top: 60),
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.asset(
          categoryList[index]['image'],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
