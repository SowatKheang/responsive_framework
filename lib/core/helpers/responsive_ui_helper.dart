
import 'package:flutter/material.dart';
import 'package:flutter_responsive_framework/flutter_responsive_framework.dart';

///
/// [ResponsiveUIHelper]
///
class ResponsiveUIHelper {
  
  /// This function builds a widget for displaying a title text with an optional font size.
  /// 
  /// Args:
  ///   [title] (String): The title parameter is a required string that represents the text to be
  /// displayed as the title in the widget.
  ///   [fontSize] (double): The `fontSize` parameter is an optional parameter of type `double`. It
  /// specifies the font size of the title text that will be displayed in the widget. If it is not
  /// provided, the default font size will be used which is [FontSizeHelper.H3].
  static Widget buildTitleTextWidget({required String title, double? fontSize}) {
    return Text(
      title, 
      style: TextStyle(fontSize: fontSize ?? FontSizeHelper.H3, fontWeight: FontWeight.w600),
    );
  }

  /// This function builds a normal text widget with the given text and optional font size.
  /// 
  /// Args:
  ///   [text] (String): The text that will be displayed in the widget. It is a required parameter, which
  /// means that it must be provided when calling the function.
  ///   [fontSize] (double): The `fontSize` parameter is an optional parameter of type `double`. It is
  /// used to specify the size of the font for the text in the widget. If it is not provided, a default
  /// font size will be used which is [FontSizeHelper.NORMAL_TEXT_MEDIUM].
  static Widget buildNormalTextWidget({required String text, double? fontSize}) {
    return Text(
      text, 
      style: TextStyle(fontSize: fontSize ?? FontSizeHelper.NORMAL_TEXT_MEDIUM),
    );
  }

  /// This function builds a platform-specific widget based on whether the device is a desktop/web, a tablet, or a
  /// mobile device.
  /// 
  /// Args:
  ///   [largeScreenWidget] (Widget): A required parameter of type Widget that represents the widget to be
  /// displayed on a desktop or web.
  ///   [tabletWidget] (Widget): A required parameter of type Widget that represents the widget to be
  /// displayed on a tablet device.
  ///   [mobileWidget] (Widget): A required parameter of type Widget that represents the widget to be
  /// displayed on mobile devices.
  static Widget buildPlatformWidget({ required Widget largeScreenWidget, required Widget tabletWidget, required Widget mobileWidget }) {
    switch (DeviceHelper.getInstance().deviceInfoModel.screenType) {
      case EScreenType.MOBILE:
        return mobileWidget;
      case EScreenType.TABLET:
        return tabletWidget;
      case EScreenType.LARGE_SCREEN:
        return largeScreenWidget;
    }
  }

  /// This function builds a platform-specific widget based on the device's orientation and type.
  /// 
  /// Args:
  ///   [larageScreenPortraitWidget] (Widget): A widget that will be displayed when the app is running on a
  /// desktop/web in portrait orientation.
  ///   [larageScreenLandScapetWidget] (Widget): This parameter is a required Widget that represents the UI
  /// component to be displayed when the device is a esktop/web and in landscape orientation.
  ///   [tabletPortraitWidget] (Widget): A widget that will be displayed when the app is running on a
  /// tablet in portrait orientation.
  ///   [tabletLandScapetWidget] (Widget): This parameter is a required Widget that represents the UI
  /// component to be displayed when the device is a tablet and in landscape orientation.
  ///   [mobilPortraitWidget] (Widget): A widget that will be displayed when the app is running on a
  /// mobile device in portrait orientation.
  ///   [mobilLandScapeWidget] (Widget): A widget that will be displayed when the device is a mobile phone
  /// and in landscape orientation.
  static Widget buildPlatformWidgetWithOrientation({ 
    required Widget larageScreenPortraitWidget, 
    required Widget larageScreenLandScapetWidget,  
    required Widget tabletPortraitWidget, 
    required Widget tabletLandScapetWidget,  
    required Widget mobilPortraitWidget,
    required Widget mobilLandScapeWidget 
  }) {

    //* Desktop/Web
    if (DeviceHelper.getInstance().isLargeScreen) {
      if (DeviceHelper.getInstance().isLandscape) {
        return larageScreenLandScapetWidget;
      }
      return larageScreenPortraitWidget;
    } else if (DeviceHelper.getInstance().isTablet) {  //* Tablet
      if (DeviceHelper.getInstance().isLandscape) {
        return tabletLandScapetWidget;
      }
      return tabletPortraitWidget;
    } else { // * Mobile
      if (DeviceHelper.getInstance().isLandscape) {
        return mobilLandScapeWidget;
      }
      return mobilPortraitWidget;
    }
  }

  //TODO: add more

}