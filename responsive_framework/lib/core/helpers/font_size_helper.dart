
import '../../responsive_framework.dart';

///
/// [FontSizeHelper] helper class for font size configuration based on [Mobile] and [Tablet]
///
class FontSizeHelper {
  
  /// HEADER 1
  static double get H1 => 24.px;
  /// HEADER 2
  static double get H2 => 22.px;
  /// HEADER 3
  static double get H3 => 20.px;
  /// HEADER 4
  static double get H4 => 18.px;
  /// HEADER 5
  static double get H5 => 16.px;
  /// HEADER 6
  static double get H6 => 14.px;

  /// NORMAL TEXT LARGE
  static double get NORMAL_TEXT_LARGE => 18.px;
  /// NORMAL TEXT MEDIUM
  static double get NORMAL_TEXT_MEDIUM => 16.px;
  /// NORMAL TEXT SMALL
  static double get NORMAL_TEXT_SMALL => 14.px;

  /// Set Custom FontSize on your own
  /// 
  /// [fontSize] (double)
  static double customFontSize(double fontSize) {
    return fontSize;
  }

  //TODO: add more

}