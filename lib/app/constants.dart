import 'package:flutter/material.dart';

class Constants {
  static const fontFamily = "Avenir";

  // color
  static const bgColor = Color(0xffFBFBFD);
  static const textPrimaryColor = Color(0xff0D0846);
  static const textSecondaryColor = Color(0xff929292);
  static const starColor = Color(0xffFFAB2E);
  static const noStarColor = Color(0xffE1E1EA);

  // assets icons
  static const searchIconAsset = "assets/icons/search.png";
  static const _starIconAsset = "assets/icons/star.png";
  static const _unstarIconAsset = "assets/icons/unstar.png";
  static Widget starIconAsset(bool isStar) => Image.asset(
        isStar ? _starIconAsset : _unstarIconAsset,
        height: 18,
        width: 18,
      );
  
  // assets images    
  static const mulanImageAsset = "assets/images/mulan_session.png";
  static const beautyAndBeastImageAsset = "assets/images/beauty_and_beast.png";
  static const johnWick4ImageAsset = "assets/images/john_wick4.png";
  static const bohemianImageAsset = "assets/images/bohemian.png";
  static const theDarkKnightImageAsset = "assets/images/the_dark_knight.png";
  static const theDark2ImageAsset = "assets/images/the_dark2.png";
  static const theDarkTowerImageAsset = "assets/images/the_dark_tower.png";
}
