import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../configuration.dart';
import '../../models/models.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    int indexDrawer = Provider.of<DrawerOptionModel>(context).number;

    return Container(
      color: primaryGreen,
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 8),
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('lib/assets/images/person.jpg'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Miroslava Saviskaya',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text('Active Status',
                      style: TextStyle(
                          color: Colors.white60, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          Column(
            children: drawerItems
                .map((element) => Padding(
                      padding: const EdgeInsets.all(15),
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<DrawerOptionModel>(context, listen: false)
                              .number = element['id'];
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              element['icon'],
                              color: indexDrawer == element['id']
                                  ? Colors.white
                                  : Colors.white38,
                              size: 30,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              element['title'],
                              style: TextStyle(
                                  color: indexDrawer == element['id']
                                      ? Colors.white
                                      : Colors.white38,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
          Row(
            children: [
              SizedBox(width: 8),
              Icon(
                Icons.settings,
                color: Colors.white60,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.white60,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Log out',
                style: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
