import 'package:flutter/material.dart';
import 'package:tv_app/views/news_details.dart';

import '../widgets/image_box.dart';
import '/services/api_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<dynamic> images = [];
  bool isLoading = true;

  @override
  void initState() {
    imagesProviders();
    super.initState();
  }

  void imagesProviders() async {
    Services imageServices = Services();
    var pics = await imageServices.newsProvider();
    debugPrint(pics.toString());
    setState(() {
      images = pics; // Ensure that pics is not null
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Loading indicator
          : GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 6),
              itemCount: images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
              itemBuilder: (c, i) {
                final imageIcon = images[i];
                final imageUrl = imageIcon['icon'];
                if (imageUrl == null || imageUrl.isEmpty) {
                  return const Center(
                      child: Icon(Icons.error)); // Fallback if no image
                }

                return GridTile(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return NewsDetails(
                          newsDetails: images[i],
                          allNewsIcons: images,
                        );
                      }));
                    },
                    child: ImageBox(
                        imageUrl: imageUrl, imageIcon: imageIcon['name']),
                  ),
                );
              },
            ),
    );
  }
}
