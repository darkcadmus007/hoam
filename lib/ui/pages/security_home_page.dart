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
            Header(),
            Expanded(child: MenuGridSecurity()),
          ],
        ),
      ),
    );
  }
}
