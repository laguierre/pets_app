import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../configuration.dart';
import '../../models/models.dart';
import '../details/details_page.dart';
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
      duration: Duration(milliseconds: 500),
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
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                  Radius.circular(isDrawerOpen ? 40.0 : 0),
                )),
                child: CarouselSlider.builder(
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.vertical,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.40,
                      initialPage: 0,
                    ),
                    itemCount: petsLength,
                    itemBuilder: (context, int index, int pageViewIndex) {
                      return GestureDetector(
                          onTap: () {
                            Provider.of<AnimalSelectedModel>(context,
                                    listen: false)
                                .number = index;
                            Navigator.of(context).push(PageRouteBuilder(
                                transitionDuration: const Duration(
                                    milliseconds: 500),
                                pageBuilder: (context, animation, _) {
                                  return FadeTransition(
                                      opacity:
                                          Tween<double>(begin: 0.0, end: 1.0)
                                              .animate(CurvedAnimation(
                                                  parent: animation,
                                                  curve: Curves.decelerate)),
                                      child: DetailsPage());
                                }));
                          },
                          child: PetDescription(index: index));
                    }),
              )),
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

class PerCategoryIconsButtons extends StatelessWidget {
  const PerCategoryIconsButtons({
    Key key,
    @required this.size,
    @required this.petCategory,
  }) : super(key: key);

  final Size size;
  final int petCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      color: const Color(0xFFF6F6F6),
      child: ListView.separated(
        padding: EdgeInsets.only(left: kPadding),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Provider.of<AnimalCategoryBottomModel>(context, listen: false)
                    .number = index;
                switch (index) {
                  case 0:
                    Provider.of<AnimalSelectedModel>(context, listen: false)
                        .petsLength = CatsList.length;
                    Provider.of<AnimalSelectedModel>(context, listen: false)
                        .categoryList = CatsList;
                    break;
                  case 1:
                    Provider.of<AnimalSelectedModel>(context, listen: false)
                        .petsLength = DogsList.length;
                    Provider.of<AnimalSelectedModel>(context, listen: false)
                        .categoryList = DogsList;
                    break;
                  case 2:
                    Provider.of<AnimalSelectedModel>(context, listen: false)
                        .petsLength = BunnyList.length;
                    Provider.of<AnimalSelectedModel>(context, listen: false)
                        .categoryList = BunnyList;
                    break;
                  case 3:
                    Provider.of<AnimalSelectedModel>(context, listen: false)
                        .petsLength = BirdsList.length;
                    Provider.of<AnimalSelectedModel>(context, listen: false)
                        .categoryList = BirdsList;
                    break;
                  case 4:
                    Provider.of<AnimalSelectedModel>(context, listen: false)
                        .petsLength = HorseList.length;
                    Provider.of<AnimalSelectedModel>(context, listen: false)
                        .categoryList = HorseList;
                    break;
                }
              },
              child: IconAnimalCategory(
                petCategory: petCategory,
                index: index,
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: kPadding,
          );
        },
      ),
    );
  }
}

class SearchBoxText extends StatelessWidget {
  const SearchBoxText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFFF6F6F6),
      padding: EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.center,
      height: 100,
      width: size.width,
      child: TextField(
          decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(CupertinoIcons.search, color: Colors.grey),
        suffixIcon: Icon(Icons.settings, color: Colors.grey),
        hintText: "Search pet to adopt",
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          borderSide: const BorderSide(
            style: BorderStyle.none,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          borderSide: BorderSide(style: BorderStyle.none),
        ),
      )),
    );
  }
}
