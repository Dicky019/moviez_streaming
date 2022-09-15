import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

import '../../../widgets/no_scoll_glow.dart';
import '../../../constants.dart';
import '../../../widgets/content_film_widget.dart';
import '../../../widgets/text_title_and_subtitle_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width * 0.78,
            color: Constants.bgColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 38),
            child: ScrollConfiguration(
              behavior: NoScollGlow(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: headerSearchWidget(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  listFilmFavoriteWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                  disneyFilmWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget disneyFilmWidget() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "From Disney",
              style: TextStyle(
                color: Constants.textPrimaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final filmContentModel = controller.listContentFilm[index];
                  return ContentFilmWidget(
                    filmContentModel: filmContentModel,
                  );
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(
                    height: 30,
                  );
                },
                itemCount: controller.listContentFilm.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listFilmFavoriteWidget() {
    return SizedBox(
      height: 279,
      child: ListView.separated(
        itemCount: controller.listFilmFavorite.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final filmContentModel = controller.listFilmFavorite[index];
          final lastIndex = index == controller.listFilmFavorite.length - 1;
          final firstIndex = index == 0;
          return Row(
            children: [
              SizedBox(
                width: firstIndex ? 24 : 0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 207,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 23,
                            width: 244,
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      filmContentModel.color.withOpacity(0.5),
                                  blurRadius: 40, // Shadow position
                                ),
                              ],
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(21),
                          child: Image.asset(
                            filmContentModel.image,
                            width: 300,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextTitleAndSubtitleWidget(
                          title: filmContentModel.title,
                          fontWeightTitle: FontWeight.w600,
                          fontSizeTitle: 20,
                          subTitle: filmContentModel.subTitle,
                          fontSizeSubTitle: 16,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: List.generate(
                            filmContentModel.star.length,
                            (index) => Constants.starIconAsset(
                              filmContentModel.star[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: lastIndex ? 24 : 0,
              ),
            ],
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 24,
          );
        },
        // ),
      ),
    );
  }

  Widget headerSearchWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TextTitleAndSubtitleWidget(
          title: "Moviez",
          subTitle: "Watch much easier",
          fontSizeTitle: 28,
          fontSizeSubTitle: 16,
        ),
        InkWell(
          onTap: () => Get.toNamed(Routes.SEARCH),
          child: Image.asset(Constants.searchIconAsset),
        ),
      ],
    );
  }
}
