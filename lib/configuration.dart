import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryGreen = Color(0xff416d6d);
const kPadding = 20.0;
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {'name': 'Cats', 'iconPath': 'lib/assets/images/cat.png'},
  {'name': 'Dogs', 'iconPath': 'lib/assets/images/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'lib/assets/images/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'lib/assets/images/parrot.png'},
  {'name': 'Horses', 'iconPath': 'lib/assets/images/horse.png'}
];

List<Map> CatsList = [
  {
    'name': 'Sola',
    'race': 'Abyssinian cat',
    'male': false,
    'years': '2 years old',
    'distance': 'Distance: 3.6km',
    'image': 'lib/assets/images/pet-cat2.png'
  },
  {
    'name': 'Orion',
    'race': 'Abyssinian cat',
    'male': true,
    'years': '1.5 years old',
    'distance': 'Distance: 7.8km',
    'image': 'lib/assets/images/pet-cat1.png'
  },
  {
    'name': 'Tigger',
    'race': 'N/A',
    'male': false,
    'years': '0.5 years old',
    'distance': 'Distance: 1.6km',
    'image': 'lib/assets/images/cat1.png'
  },
  {
    'name': 'Patch',
    'race': 'Abyssinian cat',
    'male': true,
    'years': '2.9 years old',
    'distance': 'Distance: 10.2km',
    'image': 'lib/assets/images/cat2.png'
  },
  {
    'name': 'Sassy',
    'race': 'N/A',
    'male': false,
    'years': '1.3 years old',
    'distance': 'Distance: 3.2km',
    'image': 'lib/assets/images/cat3.png'
  },
];

List<Map> DogsList = [
  {
    'name': 'Max',
    'race': 'Dutch Shepherd',
    'male': true,
    'years': '2.3 years old',
    'distance': 'Distance: 5.6km',
    'image': 'lib/assets/images/dog1.png'
  },
  {
    'name': 'Bailey',
    'race': 'N/D',
    'male': true,
    'years': '1.2 years old',
    'distance': 'Distance: 0.8km',
    'image': 'lib/assets/images/dog2.png'
  },
];

List<Map> BunnyList = [
  {
    'name': 'Snoopy',
    'race': 'N/A',
    'male': false,
    'years': '0.2 years old',
    'distance': 'Distance: 1.23km',
    'image': 'lib/assets/images/bunny1.png'
  },
  {
    'name': 'Baxter',
    'race': 'N/A',
    'male': true,
    'years': '0.2 years old',
    'distance': 'Distance: 0.8km',
    'image': 'lib/assets/images/bunny2.png'
  },
];

List<Map> BirdsList = [
  {
    'name': 'Bubba',
    'race': 'N/A',
    'male': true,
    'years': '1.2 years old',
    'distance': 'Distance: 1.23km',
    'image': 'lib/assets/images/bird1.png'
  },
  {
    'name': 'Scruffy',
    'race': 'N/A',
    'male': false,
    'years': '0.65 years old',
    'distance': 'Distance: 2.8km',
    'image': 'lib/assets/images/bird2.png'
  },
];

List<Map> HorseList = [
  {
    'name': 'Bella',
    'race': 'N/A',
    'male': true,
    'years': '5.7 years old',
    'distance': 'Distance: 22.1km',
    'image': 'lib/assets/images/horse1.png'
  },

];

List<Map> drawerItems = [
  {'id': 1, 'icon': FontAwesomeIcons.paw, 'title': 'Adoption'},
  {'id': 2, 'icon': Icons.mail, 'title': 'Donation'},
  {'id': 3, 'icon': FontAwesomeIcons.plus, 'title': 'Add pet'},
  {'id': 4, 'icon': Icons.favorite, 'title': 'Favorites'},
  {'id': 5, 'icon': Icons.mail, 'title': 'Messages'},
  {'id': 6, 'icon': FontAwesomeIcons.userLarge, 'title': 'Profile'},
];

const String dummyText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

const int animationDuration = 800;