import 'package:flutter/material.dart';
import 'package:hoam_v1/ui/components/appbar_widget.dart';
import '../components/header.dart';
import '../components/header_two.dart';
import '../components/image_carousel.dart';

import '../components/menu_grid_security.dart';

class SecurityHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Security',
      ),
      body: SafeArea(
        child: Column(
          children: [
            HeaderTwo(),
            Expanded(child: MenuGridSecurity()),
          ],
        ),
      ),
    );
  }
}
