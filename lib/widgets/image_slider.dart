import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/views/news_details.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key, required this.images});
  final List<dynamic> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (context, index, realIndex) {
        final image = images[index];

        // Using a placeholder image and error handling for broken URLs
        return image == null
            ? const Center(
                child: Icon(Icons.error),
              )
            : GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewsDetails(
                          newsDetails: image, allNewsIcons: images)));
                },
                child: Image.network(image['icon']));
      },
      options: CarouselOptions(
        autoPlay: true,
        scrollDirection: Axis.horizontal,
        viewportFraction: 0.8, // This creates the "peek" effect
        enableInfiniteScroll: true,
        enlargeCenterPage: true, // Enlarge the centered image for emphasis
      ),
    );
  }
}
