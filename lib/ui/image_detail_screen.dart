import 'package:f_review/constants.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageDetailScreen extends StatelessWidget {
  const ImageDetailScreen(
      {Key? key, required this.galleryItems, required this.pageController})
      : super(key: key);

  final List<dynamic> galleryItems;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider:
                    NetworkImage("$kBaseUrl/review_img/${galleryItems[index]}"),
                initialScale: PhotoViewComputedScale.contained * 1,
                heroAttributes:
                    PhotoViewHeroAttributes(tag: galleryItems[index]),
              );
            },
            itemCount: galleryItems.length,
            loadingBuilder: (context, event) => Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(
                  value: event == null
                      ? 0
                      : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                ),
              ),
            ),
            backgroundDecoration: const BoxDecoration(color: Colors.white),
            pageController: pageController,
          ),
        ),
      ),
    );
  }
}
