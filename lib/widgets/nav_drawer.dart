// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assgn_digia_tech/main.dart';
import 'package:assgn_digia_tech/pages/business_news.dart';
import 'package:assgn_digia_tech/pages/food_news.dart';
import 'package:assgn_digia_tech/pages/tech_news.dart';
import 'package:flutter/material.dart';

class navDrawer extends StatefulWidget {
  const navDrawer({Key? key}) : super(key: key);

  @override
  _navDrawerState createState() => _navDrawerState();
}

class _navDrawerState extends State<navDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.cyan[50],
        child: ListView(
          children: [
            SizedBox(height: 50),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyHomePage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Technology',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              leading: Icon(
                Icons.smartphone_outlined,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TechNews();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Business',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              leading: Icon(
                Icons.attach_money_outlined,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BusinessNews();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Food',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              leading: Icon(
                Icons.fastfood_outlined,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FoodNews();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
