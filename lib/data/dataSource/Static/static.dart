import 'package:focalx_task6/data/model/positionedImageModel.dart';
import '../../../core/constant_data/images.dart';
import '../../model/onBoardingModel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    images: [
      PositionedImageModel(
        imagePath: AppImages.shapeOneImage,
        top: 90,
        left: 59,
      ),
      PositionedImageModel(
        imagePath: AppImages.shapeTwoImage,
        top: 155,
        right: 71,
      ),
      PositionedImageModel(
        imagePath: AppImages.vectorImage,
        top: 414,
        left: 150,
      ),
    ],
    title: 'WELCOME TO \n BYTE BOUTIQUE',
    body: ""
  ),
  OnBoardingModel(
    images: [
      PositionedImageModel(
        imagePath: AppImages.shapeFourImage,
        top: 116,
        left: 27,
      ),
      PositionedImageModel(
        imagePath: AppImages.shapeTwoImage,
        top: 113,
        right: 26,
      ),
    ],
    title: 'Let\'s Start Journey',
    body: 'Smart, Gorgeous & Fashionable \n Collection Explor Now',
  ),
  OnBoardingModel(
    images: [
      PositionedImageModel(
        imagePath: AppImages.shapeTwoImage,
        top: 108,
        left: 52,
      ),
    ],
    title: 'You Have The \n Power To',
    body:
        'There Are Many Beautiful And Attractive \n Plants To Your Room',
  ),
];
