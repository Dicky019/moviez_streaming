import 'dart:ui';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../models/content_film_model.dart';

class HomeController extends GetxController {
  final listContentFilm = [
    ContentFilmModel(
      color: const Color(0xff169E9F),
      title: "Mulan Session",
      subTitle: "History, War",
      image: Constants.mulanImageAsset,
      star: [
        true,
        true,
        true,
        false,
        false,
      ],
    ),
    ContentFilmModel(
      title: "Beauty & Beast",
      subTitle: "Sci-Fiction",
      image: Constants.beautyAndBeastImageAsset,
      color: const Color(0xff174459),
      star: [
        true,
        true,
        true,
        true,
        true,
      ],
    ),
  ];

  final listFilmFavorite = [
    ContentFilmModel.withoutStar(
      color: const Color(0xff5E38E5),
      title: "John Wick 4",
      subTitle: "Watch much easier",
      image: Constants.johnWick4ImageAsset,
    ),
    ContentFilmModel.withoutStar(
      title: "Beauty & Beast",
      subTitle: "Sci-Fiction",
      image: Constants.bohemianImageAsset,
      color: const Color(0xffFE7B02),
    ),
  ];
}
