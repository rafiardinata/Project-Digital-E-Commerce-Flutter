// ignore_for_file: file_names, use_key_in_widget_constructors, unnecessary_string_escapes, prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final List<String> categoryName = [
    "",
    "Women\'s Heels",
    "Women\'s Watch",
    "Backpag",
    "Foldabag",
    "Women\'s Foldabag",
    "Women Heels",
    "Smartwatch",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 1; i < categoryName.length; i++)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/$i.png",
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    "${categoryName[i]}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xFF004D40),
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
