import 'package:flutter/material.dart';
import '../components/header.dart';
import '../components/image_carousel.dart';

import '../components/menu_grid_security.dart';

class SecurityHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Security")),
      body: SafeArea(
        child: Column(
          children: [
          Padding(
              padding: const EdgeInsets.only(top: 25, left:10, right:10),
              child: Header(),
            ),
            Expanded(child: MenuGridSecurity()),
          ],
        ),
      ),
    );
  }
}
