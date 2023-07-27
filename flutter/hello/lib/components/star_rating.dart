
import 'package:flutter/material.dart';

class StarRateAppTest extends StatelessWidget {
  const StarRateAppTest({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Rating Star Test"),
        ),
        body: const Center(child: StarRating(rating: 2.6)),
      ),
    );
  }
}

class StarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final Widget unselectImage;
  final Widget selectedImage;
  final int imageCount;
  final double imageSize;
  final Color unselectedColor;
  final Color selectedColor;

  const StarRating({Key? key,
    required this.rating,
    this.maxRating = 5,
    this.imageCount = 5,
    this.imageSize = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffe0aa46),
    this.unselectImage = const Icon(Icons.star, size: 30, color: Color(0xffbbbbbb)),
    this.selectedImage = const Icon(Icons.star, size: 30, color: Color(0xffe0aa46))
  }): super(key: key);

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.imageCount, (index) => widget.unselectImage),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: getSelectImage(),
        )
      ],
    );
  }

  List<Widget> getSelectImage() {
    double oneStarScore = widget.maxRating / widget.imageCount;
    int integer = (widget.rating / oneStarScore).floor();
    double part = widget.rating - integer;

    List<Widget> selectedImages = [];
    for (int i = 0; i < integer; i++) {
      selectedImages.add(widget.selectedImage);
    }

    Widget leftStar = ClipRect(
      clipper: MyRectClipper(width: (part / oneStarScore) * widget.imageSize),
      child: widget.selectedImage,
    );
    selectedImages.add(leftStar);

    return selectedImages;
  }
}


class MyRectClipper extends CustomClipper<Rect>{
  final double width;

  MyRectClipper({
    required this.width
  });

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyRectClipper oldClipper) {
    return width != oldClipper.width;
  }
}





