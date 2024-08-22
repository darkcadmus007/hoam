import 'package:flutter/material.dart';
import '../components/header.dart';
import '../components/image_carousel.dart';
import '../components/menu_grid.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left:10, right:10),
              child: Header(),
            ),
            Padding(
            padding: const EdgeInsets.only(top: 20),
              child: ImageCarousel(),
            ),
            Expanded(child: MenuGrid()),
          ],
        ),
      ),
    );
  }
}
