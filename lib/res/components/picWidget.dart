import 'package:flutter/material.dart';

class PicWidget extends StatelessWidget {
  String image;
  Size size;
  PicWidget({super.key, required this.image, required this.size});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.indigo,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(0.5, 0.5),
                  blurRadius: 2)
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://image.tmdb.org/t/p/w342$image'),
            )),
        width: size.width * 0.33,
        height: size.height * 0.2,
      ),
    );
  }
}
