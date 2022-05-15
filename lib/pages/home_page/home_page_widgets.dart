import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../configuration.dart';
import '../../models/models.dart';
import '../details/details_page.dart';

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

class AnimalList extends StatelessWidget {
  const AnimalList({
    Key key,
    @required this.size,
    @required this.isDrawerOpen,
    @required this.petsLength,
  }) : super(key: key);

  final Size size;
  final bool isDrawerOpen;
  final int petsLength;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      transitionDuration:
                      const Duration(milliseconds: 500),
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
      padding: EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.center,
      height: 100,
      width: size.width,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
          enabled: false,
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
            disabledBorder: const OutlineInputBorder(
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
