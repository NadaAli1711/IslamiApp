import 'package:get/get.dart';

class ContextSize {
  static double get width => Get.width;

  static double get height => Get.height;

  static double heightPercentage(double currentHeight) =>
      (currentHeight / 932) * height;

  static double widthPercentage(double currentWidth) =>
      (currentWidth / 430) * width;
}
