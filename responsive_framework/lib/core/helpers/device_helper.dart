
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import '../../responsive_framework.dart';

///
/// [DeviceHelper] stores device information related to device [ScreenType] and [Orientation]
///
class DeviceHelper {

  static const String PLATFORM_IOS_TEXT = 'iOS';
  static const String PLATFORM_ANDROID_TEXT = 'Android';

  DeviceInfoModel _deviceInfoModel = new DeviceInfoModel();

  static DeviceHelper? _instance;
  
  static DeviceHelper getInstance() {
    if (_instance == null) {
      _instance = new DeviceHelper();
    }
    return _instance!;
  }

  DeviceInfoModel get deviceInfoModel => _deviceInfoModel;
  String get platFormText => Platform.isIOS ? DeviceHelper.PLATFORM_IOS_TEXT : DeviceHelper.PLATFORM_ANDROID_TEXT;
  bool get isLandscape => _deviceInfoModel.isLandscape;
  bool get isTablet => _deviceInfoModel.isTablet;

  EScreenType get screenType => _deviceInfoModel.screenType;
  Orientation get orientation => _deviceInfoModel.orientation;

  /// This allows a value of type T or T?
  /// to be treated as a value of type T?.
  ///
  /// We use this so that APIs that have become
  /// non-nullable can still be used with `!` and `?`
  /// to support older versions of the API as well.
  static T? _ambiguate<T>(T? value) => value;

  void setDeivceInfo(
    BuildContext context,
    BoxConstraints constraints,
    Orientation currentOrientation,
    double maxMobileWidth, [
    double? maxTabletWidth,
  ]) {
    
    // Set Orientation
    _deviceInfoModel.orientation = currentOrientation;

    // Sets screen width and height
    _deviceInfoModel.WIDTH = constraints.maxWidth;
    _deviceInfoModel.HEIGHT = constraints.maxHeight;

    // Sets aspect and pixel ratio
    _deviceInfoModel.ASPECT_RATIO = constraints.constrainDimensions(_deviceInfoModel.WIDTH, _deviceInfoModel.HEIGHT).aspectRatio;
    _deviceInfoModel.PIXEL_RATIO = _ambiguate(WidgetsBinding.instance)!.window.devicePixelRatio;

    // Sets DeviceType
    if (kIsWeb) {
      _deviceInfoModel.deviceType = EDeviceType.WEB;
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          _deviceInfoModel.deviceType = EDeviceType.ANDROID;
          break;
        case TargetPlatform.iOS:
          _deviceInfoModel.deviceType = EDeviceType.IOS;
          break;
        case TargetPlatform.windows:
          _deviceInfoModel.deviceType = EDeviceType.WINDOWS;
          break;
        case TargetPlatform.macOS:
          _deviceInfoModel.deviceType = EDeviceType.MAC;
          break;
        case TargetPlatform.linux:
          _deviceInfoModel.deviceType = EDeviceType.LINUX;
          break;
        case TargetPlatform.fuchsia:
          _deviceInfoModel.deviceType = EDeviceType.FUCHSIA;
          break;
      }
    }

    // Sets ScreenType
    if ((!isLandscape && _deviceInfoModel.WIDTH <= maxMobileWidth) || (isLandscape && _deviceInfoModel.HEIGHT <= maxMobileWidth)) {
      _deviceInfoModel.screenType = EScreenType.MOBILE;
    } else if (maxTabletWidth == null || (!isLandscape && _deviceInfoModel.WIDTH <= maxTabletWidth) || (isLandscape && _deviceInfoModel.HEIGHT <= maxTabletWidth)) {
      _deviceInfoModel.screenType = EScreenType.TABLET;
    } else {
      _deviceInfoModel.screenType = EScreenType.DESKTOP;
    }
  }

}