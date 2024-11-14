import 'package:flutter/material.dart';
class ImageBox extends StatelessWidget {
  const ImageBox({
    super.key,
    required this.imageUrl,
    required this.imageIcon,
  });

  final dynamic imageUrl;
  final dynamic imageIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: Text(
                      imageIcon,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            )));
  }
}
