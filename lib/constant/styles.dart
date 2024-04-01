import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/constant/dimensions.dart';
import 'package:olivehealth_delivery/constant/font_constant.dart';

media(context){
  final height= MediaQuery.of(context).size.height;
}



final robotoRegular = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.FONT_SIZE_SMALL,
  color: Colors.black
);
final robotoRegularwhite = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.FONT_SIZE_SMALL,
    color: Colors.white
);

final robotoMedium = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.FONT_SIZE_SMALL,
    color: Colors.black

);

final robotoBold = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w700,
  fontSize:  Dimensions.FONT_SIZE_DEFAULT,
    color: Colors.black

);

final robotoBlack = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w100,
  fontSize:  Dimensions.FONT_SIZE_DEFAULT,
  color: Colors.black
);

final acmeRegular = TextStyle(
  fontFamily: AppConstants.fontAcme,
  fontWeight: FontWeight.w400,
  fontSize:  Dimensions.FONT_SIZE_DEFAULT,
);

final acmeMedium = TextStyle(
  fontFamily: AppConstants.fontAcme,
  fontWeight: FontWeight.w500,
  fontSize:  Dimensions.FONT_SIZE_DEFAULT,
);

final acmeBold = TextStyle(
  fontFamily: AppConstants.fontAcme,
  fontWeight: FontWeight.w700,
  fontSize:  Dimensions.FONT_SIZE_DEFAULT,
);

final acmeBlack = TextStyle(
  fontFamily: AppConstants.fontAcme,
  fontWeight: FontWeight.w900,
  fontSize:  Dimensions.FONT_SIZE_DEFAULT,
);

final RighteousRegular = TextStyle(
  fontFamily: AppConstants.fontRighteous,
  fontWeight: FontWeight.w400,
  fontSize:  Dimensions.FONT_SIZE_DEFAULT,
);

final RighteousMedium = TextStyle(
  fontFamily: AppConstants.fontRighteous,
  fontWeight: FontWeight.w500,
  fontSize:  Dimensions.FONT_SIZE_DEFAULT,
);

final RighteousBold = TextStyle(
  fontFamily: AppConstants.fontRighteous,
  fontWeight: FontWeight.w700,
  fontSize:  Dimensions.FONT_SIZE_DEFAULT,
);

final RighteousBlack = TextStyle(
  fontFamily: AppConstants.fontRighteous,
  fontWeight: FontWeight.w900,
  fontSize:  Dimensions.FONT_SIZE_DEFAULT,
);

