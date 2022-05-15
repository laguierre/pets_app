import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../configuration.dart';
import '../../models/models.dart';
import 'home_page_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _xOffset = 0;
  double _yOffset = 0;
  double _scaleFactor = 1;
  bool isDrawerOpen = false;
  int currentPage = 0;
  int page = 0;
  double value = 0;
  double sizePetDescription;

  @override
  Widget build(BuildContext context) {
    int petCategory = Provider.of<AnimalCategoryBottomModel>(context).number;
    var size = MediaQuery.of(context).size;
    int petsLength = Provider.of<AnimalSelectedModel>(context).petsLength;
    sizePetDescription = MediaQuery.of(context).size.height * 0.27;
    return AnimatedContainer(
      curve: Curves.decelerate,
      transform: Matrix4.translationValues(_xOffset, _yOffset, 0)
        ..scale(_scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40.0 : 0),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: size.height * 0.12),
            decoration: BoxDecoration(
                color: const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(isDrawerOpen ? 40.0 : 0),
                  topRight: Radius.circular(kPadding * 1.5),
                  topLeft: Radius.circular(kPadding * 1.5),
                )),
          ),
          Positioned(
              top: size.height * (0.17),
              bottom: 0,
              child: AnimalList(size: size, isDrawerOpen: isDrawerOpen, petsLength: petsLength)),
          Positioned(
            top: 15,
            child: Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  isDrawerOpen
                      ? IconButton(
                          icon: Icon(Icons.arrow_back_ios, size: 30),
                          onPressed: () {
                            setState(() {
                              _xOffset = 0;
                              _yOffset = 0;
                              _scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          })
                      : IconButton(
                          icon: Icon(Icons.menu, size: 35),
                          onPressed: () {
                            setState(() {
                              _xOffset = 230;
                              _yOffset = 150;
                              _scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          }),
                  Column(
                    children: <Widget>[
                      Text('Location',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black54)),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: primaryGreen,
                          ),
                          const Text(
                            'Kyiv, ',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const Text('Ukraine',
                              style: TextStyle(
                                fontSize: 24,
                              )),
                        ],
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('lib/assets/images/person.jpg'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.13,
            child: SearchBoxText(),
          ),
          Positioned(
            top: size.height * 0.25,
            child: Container(
              alignment: Alignment.center,
              width: size.width,
              height: size.height * 0.135,
              child:
                  PerCategoryIconsButtons(size: size, petCategory: petCategory),
            ),
          ),
        ],
      ),
    );
  }
}
