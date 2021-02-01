import 'package:flutter/material.dart';
import 'package:flutter_workshop/favorite.dart';
import 'package:flutter_workshop/home.dart';
import 'package:flutter_workshop/profile.dart';
import '../user_list.screen.dart';

class TabNavigationItem {
  final Widget screen;
  final String label;
  final Icon icon;

  TabNavigationItem({
    @required this.screen,
    @required this.label,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      screen: Home(),
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    TabNavigationItem(
      screen: UserListScreen(),
      icon: Icon(Icons.people),
      label: 'User',
    ),
    // TabNavigationItem(
    //   screen: Favorite(),
    //   icon: Icon(Icons.favorite),
    //   label: 'Favorite',
    // ),
    TabNavigationItem(
      screen: Profile(),
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];
}