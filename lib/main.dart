import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'pages/custom_drawer/drawScreen.dart';
import 'models/models.dart';
import 'pages/home_page/homeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status color bar
    statusBarIconBrightness: Brightness.light, // status bar icon color
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AnimalCategoryBottomModel()),
      ChangeNotifierProvider(create: (_) => AnimalSelectedModel()),
      ChangeNotifierProvider(create: (_) => DrawerOptionModel()),
    ],
    child: MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Circular'),
    ),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            DrawerScreen(),
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
