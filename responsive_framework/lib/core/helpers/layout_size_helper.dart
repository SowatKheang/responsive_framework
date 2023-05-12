
import 'dart:math';
import '../../responsive_framework.dart';

///
/// [LayoutSizeHelper]
///
class LayoutSizeHelper {

  static double h(num height) => height.h;

  static double w(num width) => width.w;

  static double px(num pixel) => pixel.px;

  static double dp(num densityPixel) => densityPixel.dp;

  //TODO: add more

}

///
/// [DeviceExtention]
///
extension DeviceExtention on num {

  static DeviceInfoModel _deviceInfoModel = DeviceHelper.getInstance().deviceInfoModel;

  //* Absolute length units 
  // https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Values_and_units

  /// The respective value in centimeters
  double get cm => this * (_deviceInfoModel.isTablet ? 37.8 : 38.8);

  /// The respective value in inches
  double get inches => this * (_deviceInfoModel.isTablet ? 96 : 98);

  /// The respective value in points (1/72th of 1 inch)
  double get pt => this * inches / (_deviceInfoModel.isTablet ? 72 : 70);

  /// The respective value in pixels (default)
  //? Need to refactor
  // double get px => this * (_deviceInfoModel.isTablet ? (_deviceInfoModel.ASPECT_RATIO * 1.1) : (_deviceInfoModel.ASPECT_RATIO * 2));
  double get px  {
    // debugPrint('ASPECT_RATIO: ${_deviceInfoModel.ASPECT_RATIO}');
    if (_deviceInfoModel.isTablet) {
      return this * (_deviceInfoModel.isLandscape ? (_deviceInfoModel.ASPECT_RATIO * 1.2) : (_deviceInfoModel.ASPECT_RATIO * 2.2));
    }
    return this * (_deviceInfoModel.isLandscape ? (_deviceInfoModel.ASPECT_RATIO * .5) : (_deviceInfoModel.ASPECT_RATIO * 2));
  }

  //* Relative length units
  // https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Values_and_units

  /// Respective percentage of the viewport's smaller dimension.
  double get vmin => this * min(_deviceInfoModel.HEIGHT, _deviceInfoModel.WIDTH) / 100;

  /// Respective percentage of the viewport's larger dimension.
  double get vmax => this * max(_deviceInfoModel.HEIGHT, _deviceInfoModel.WIDTH) / 100;

  /// Calculates the height depending on the device's screen size
  ///
  /// e.g.: 20.h -> will take 20% of the screen's height
  double get h => this * _deviceInfoModel.HEIGHT / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// e.g.: 20.h -> will take 20% of the screen's width
  double get w => this * _deviceInfoModel.WIDTH / 100;

  /// Calculates the material dp (Pixel Density)
  /// (https://material.io/design/layout/pixel-density.html#pixel-density-on-android))
  double get dp => this * (w * 160) / _deviceInfoModel.PIXEL_RATIO;

}