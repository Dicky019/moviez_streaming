import 'dart:ui';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../models/content_film_model.dart';

class SearchController extends GetxController {
 final listContentFilm = [
    ContentFilmModel(
      color: const Color(0xff169E9F),
      title: "The Dark II",
      subTitle: "Horor",
      image: Constants.theDark2ImageAsset,
      star: [
        true,
        true,
        true,
        true,
        false,
      ],
    ),
    ContentFilmModel(
      title: "The Dark Knight",
      subTitle: "Heroes",
      image: Constants.theDarkKnightImageAsset,
      color: const Color(0xff0C76D3),
      star: [
        true,
        true,
        true,
        true,
        true,
      ],
    ),
    ContentFilmModel(
      title: "The Dark Tower",
      subTitle: "Action",
      image: Constants.theDarkTowerImageAsset,
      color: const Color(0xff394144),
      star: [
        true,
        true,
        true,
        true,
        true,
      ],
    ),
  ];

  final listSearch = <ContentFilmModel>[];

  search (){
    
  }
}
