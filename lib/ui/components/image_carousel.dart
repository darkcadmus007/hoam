import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final List<String> imagePaths = [
    'assets/images/img1.jpg',
    'assets/images/img2.png',
    'assets/images/img3.png',
  ];

  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          carouselController: _controller,
          items: imagePaths.map((imagePath) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                     Radius.circular(5)
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: IconButton(
            icon: Icon(Icons.arrow_left,
                size: 30, color: Color.fromARGB(255, 134, 134, 134)),
            onPressed: () {
              _controller.previousPage();
            },
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: IconButton(
            icon: Icon(Icons.arrow_right,
                size: 30, color: const Color.fromARGB(255, 134, 134, 134)),
            onPressed: () {
              _controller.nextPage();
            },
          ),
        ),
      ],
    );
  }
}
