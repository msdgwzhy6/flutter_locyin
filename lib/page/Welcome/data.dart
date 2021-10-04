import 'package:flutter/material.dart';

var pageList = [
  PageModel(
      imageUrl: "assets/images/illustration1.png",
      title: "游记 Vlog",
      body: "水光潋滟晴方好，山色空蒙雨亦奇",
      titleGradient: gradients[0]),
  PageModel(
      imageUrl: "assets/images/illustration2.png",
      title: "互动 交友",
      body: "故人西辞黄鹤楼，烟花三月下扬州",
      titleGradient: gradients[1]),
  PageModel(
      imageUrl: "assets/images/illustration3.png",
      title: "地图 检索",
      body: "洛下逢君，志在游寻四方",
      titleGradient: gradients[2]),
];

List<List<Color>> gradients = [
  [Color(0xFF9708CC), Color(0xFF43CBFF)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)],
];

class PageModel {
  var imageUrl;
  var title;
  var body;
  List<Color> titleGradient = [];
  PageModel({this.imageUrl, this.title, this.body, required this.titleGradient});
}
