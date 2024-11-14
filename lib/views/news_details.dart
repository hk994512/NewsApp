import 'package:flutter/material.dart';
import 'package:tv_app/services/methods.dart';
import 'package:tv_app/widgets/image_slider.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails(
      {super.key, required this.newsDetails, required this.allNewsIcons});
  final dynamic newsDetails;
  final List<dynamic> allNewsIcons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            newsDetails['icon'],
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                Methods.openUrl(newsDetails['url']);
              },
              child: Text(newsDetails['url'])),
          const SizedBox(height: 10),
          Text("Title:${Methods.convertString(newsDetails['id'])}"),
          const SizedBox(height: 10),
          Text(
            "Category: ${newsDetails['category']}",
          ),
          const SizedBox(height: 10),
          Text("Language: ${newsDetails['language']}"),
          const SizedBox(height: 10),
          Text("Country: ${newsDetails['country']}"),
          const SizedBox(
            height: 10,
          ),
          Text("Description :${newsDetails['description']}"),
          const SizedBox(
            height: 15,
          ),
          const Text("Similar News"),
          ImageSlider(images: allNewsIcons)
        ],
      ),
    ));
  }
}
