import 'dart:developer';
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
    ContentFilmModel(
      color: const Color(0xff5E38E5),
      title: "John Wick 4",
      subTitle: "Watch much easier",
      image: Constants.johnWick4ImageAsset,
      star: [
        true,
        true,
        true,
        true,
        true,
      ],
    ),
    ContentFilmModel(
      title: "Bohemian",
      subTitle: "Documentary",
      image: Constants.bohemianImageAsset,
      color: const Color(0xffFE7B02),
      star: [
        true,
        true,
        true,
        true,
        true,
      ],
    ),
  ];

  final listSearch = <ContentFilmModel>[].obs;

  void search(String text) {
    listSearch.value = [...listContentFilm];
    if (text.trim().isNotEmpty) {
      log(text);
      listSearch.value = listContentFilm.where((element) => element.title.toLowerCase().contains(text.toLowerCase())).toList();
      // log(list.toString());
    }
  }

  @override
  void onInit() {
    listContentFilm.sort((a,b)=>a.title.compareTo(b.title));
    listSearch.value = listContentFilm;

    super.onInit();
  }
}
