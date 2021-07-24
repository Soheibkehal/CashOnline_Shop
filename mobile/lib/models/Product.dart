import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String image;

  Product({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.image,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 0,
    name: "Wireless Controller for PS4™",
    price: 64.99,
    image: "assets/images/ps4_console_white_1.png",
  ),
  Product(
    id: 1,
    name: "Nike Sport White - Man Pant",
    price: 50.5,
    image: "assets/images/ps4_console_white_1.png",
  ),
  Product(
    id: 2,
    name: "Gloves XC Omega - Polygon",
    price: 36.55,
    image: "assets/images/ps4_console_white_1.png",
  ),
  Product(
    id: 3,
    name: "Logitech Head",
    price: 20.20,
    image: "assets/images/ps4_console_white_1.png",
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";