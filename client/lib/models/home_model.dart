import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeModel {
  final String name;
  final IconData icon;

  HomeModel({required this.name, required this.icon});
}

List<HomeModel> firstHomeList = [
  HomeModel(name: 'Add supplier', icon: FontAwesomeIcons.plus),
  HomeModel(name: 'Update supplier', icon: FontAwesomeIcons.repeat),
];
List<HomeModel> secondHomeList = [
  HomeModel(name: 'All suppliers', icon: FontAwesomeIcons.list),
  HomeModel(name: 'Search supplier', icon: FontAwesomeIcons.magnifyingGlass),
];
