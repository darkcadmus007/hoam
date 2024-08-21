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
            Header(),
            ImageCarousel(),
            Expanded(child: MenuGrid()),
          ],
        ),
      ),
    );
  }
}
