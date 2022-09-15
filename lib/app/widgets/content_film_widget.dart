import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/content_film_model.dart';
import 'text_title_and_subtitle_widget.dart';

class ContentFilmWidget extends StatelessWidget {
  const ContentFilmWidget({
    Key? key,
    required this.filmContentModel,
  }) : super(key: key);

  final ContentFilmModel filmContentModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        imageBlurWidget(
          image: filmContentModel.image,
          color: filmContentModel.color,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextTitleAndSubtitleWidget(
              title: filmContentModel.title,
              fontWeightTitle: FontWeight.w600,
              fontSizeTitle: 20,
              subTitle: filmContentModel.subTitle,
              fontSizeSubTitle: 16,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: List.generate(
                filmContentModel.star.length,
                (index) => Constants.starIconAsset(
                  filmContentModel.star[index],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget imageBlurWidget({required String image, required Color color}) {
    return SizedBox(
      height: 127,
      width: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 16,
              width:82 ,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.5),
                    blurRadius: 40, // Shadow position
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(21),
            child: Image.asset(
              image,
              width: 100,
              height: 125.6,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}