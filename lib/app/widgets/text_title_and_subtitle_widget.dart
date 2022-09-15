import 'package:flutter/material.dart';

import '../constants.dart';

class TextTitleAndSubtitleWidget extends StatelessWidget {
  final String title, subTitle;
  final FontWeight? fontWeightTitle, fontWeightSubTitle;
  final double fontSizeTitle, fontSizeSubTitle;
  const TextTitleAndSubtitleWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    this.fontWeightTitle = FontWeight.w900,
    this.fontWeightSubTitle = FontWeight.w200,
    required this.fontSizeTitle,
    required this.fontSizeSubTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.textPrimaryColor,
            fontSize: fontSizeTitle,
            fontWeight: fontWeightTitle,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          subTitle,
          style: TextStyle(
            color: Constants.textSecondaryColor,
            fontSize: fontSizeSubTitle,
            fontWeight: fontWeightSubTitle,
          ),
        ),
      ],
    );
  }
}