import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final List<String> images = [
    'assets/images/image_1.png',
    'assets/images/image_2.png',
    'assets/images/image_3.png',
    'assets/images/image_4.png',
  ];

  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          carouselController: _controller,
          items:
              images.map((path) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(path),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
          options: CarouselOptions(
            height: 250,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 8),
            autoPlayCurve: Curves.easeInOut,
            enlargeCenterPage: false,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: images.length,
            effect: ExpandingDotsEffect(
              dotWidth: 5,
              dotHeight: 5,
              activeDotColor: Colors.white,
              dotColor: Colors.white.withValues(alpha: 0.5),
              expansionFactor: 2.0, // Membuat indikator lonjong saat aktif
            ),
            onDotClicked: (index) {
              _controller.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ],
    );
  }
}
