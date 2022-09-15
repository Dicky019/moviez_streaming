import 'dart:ui';

class ContentFilmModel {
  final String title, subTitle, image;
  final List<bool> star;
  final Color color;

  ContentFilmModel({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.star,
    required this.color,
  });

  factory ContentFilmModel.withoutStar({
    required String title,
    required String subTitle,
    required String image,
    required Color color,
  }) {
    return ContentFilmModel(
      color: color,
      image: image,
      star: [],
      subTitle: subTitle,
      title: title,
    );
  }
}
