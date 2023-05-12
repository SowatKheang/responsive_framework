

import 'package:flutter/material.dart';
import '../../flutter_responsive_framework.dart';

///
/// [DeviceInfoModel]
///
class DeviceInfoModel {

  late double _HEIGHT;
  late double _WIDTH;
  late double _ASPECT_RATIO;
  late double _PIXEL_RATIO;

  late EDeviceType _deviceType;
  late EScreenType _screenType;
  late Orientation _orientation;

  bool get isTablet => this.screenType == EScreenType.TABLET;
  bool get isLandscape => this._orientation == Orientation.landscape;

  /// Getters
  double get HEIGHT => _HEIGHT;
  double get WIDTH => _WIDTH;
  double get ASPECT_RATIO => _ASPECT_RATIO;
  double get PIXEL_RATIO => _PIXEL_RATIO;

  EDeviceType get deviceType => _deviceType;
  EScreenType get screenType => _screenType;
  Orientation get orientation => _orientation;

  /// Setters
  set HEIGHT(double height) => this._HEIGHT = height;
  set WIDTH(double width) => this._WIDTH = width;
  set ASPECT_RATIO(double aspectRatio) => this._ASPECT_RATIO = aspectRatio;
  set PIXEL_RATIO(double pixelRatio) => this._PIXEL_RATIO = pixelRatio;

  set deviceType(EDeviceType deviceType) => this._deviceType = deviceType;
  set screenType(EScreenType screenType) => this._screenType = screenType;
  set orientation(Orientation orientation) => this._orientation = orientation;

}