import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../widgets/content_film_widget.dart';
import '../../../widgets/no_scoll_glow.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bgColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 38),
        child: ScrollConfiguration(
          behavior: NoScollGlow(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchWidget(),
              Text(
                "Search Result ($3)",
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
      ),
    );
  }

  ClipRRect searchWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(45 / 2),
      child: SizedBox(
        width: 327,
        height: 45,
        child: TextFormField(
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w200,
            height: 1.7,
          ),
          cursorColor: Constants.textPrimaryColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.white,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            prefixIcon: Image.asset(Constants.searchIconAsset),
          ),
        ),
      ),
    );
  }
}
