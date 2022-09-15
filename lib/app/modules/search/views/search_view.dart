import 'dart:developer';

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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            height: Get.height,
            width: Get.width * 0.78,
            color: Constants.bgColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 38),
            child: ScrollConfiguration(
              behavior: NoScollGlow(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  searchWidget(),
                  const SizedBox(
                    height: 35,
                  ),
                  textResultSearch(),
                  const SizedBox(
                    height: 20,
                  ),
                  listSearchWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: floatingActionButtonCostumWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Padding floatingActionButtonCostumWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: SizedBox(
        height: 60,
        width: 220,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 10,
                width: 178,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Constants.textPrimaryColor.withOpacity(0.5),
                      blurRadius: 40, // Shadow position
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 220,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Constants.textPrimaryColor,
              ),
              child: InkWell(
                onTap: () {
                  log("message");
                },
                child: const Center(
                  child: Text(
                    "Suggest Movie",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text textResultSearch() {
    return Text(
      "Search Result (${controller.listSearch.length})",
      style: const TextStyle(
        color: Constants.textPrimaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Expanded listSearchWidget() {
    return Expanded(
      child: Obx(() => ListView.separated(
            itemBuilder: (context, index) {
              final filmContentModel = controller.listSearch[index];
              return Column(
                children: [
                  ContentFilmWidget(
                    filmContentModel: filmContentModel,
                  ),
                  if (index == controller.listSearch.length - 1)
                    const SizedBox(
                      height: 20,
                    ),
                ],
              );
            },
            separatorBuilder: (_, index) {
              return const SizedBox(
                height: 30,
              );
            },
            itemCount: controller.listSearch.length,
          )),
    );
  }

  ClipRRect searchWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(45 / 2),
      child: SizedBox(
        width: 327,
        height: 45,
        child: TextFormField(
          onChanged: (text) => controller.search(text),
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
