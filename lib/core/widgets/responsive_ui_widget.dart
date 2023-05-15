
import 'package:flutter/material.dart';
import '../../flutter_responsive_framework.dart';

/// 
/// Provides [BuildContext], [Orientation], and [EScreenType] parameters to the builder function
/// 
typedef ResponsiveBuilder = Widget Function(BuildContext, Orientation, EScreenType);

/// 
/// [ResponsiveUIWidget] a widget for creating responsive user interfaces.
/// 
class ResponsiveUIWidget extends StatefulWidget {

  final ResponsiveBuilder builder;

  const ResponsiveUIWidget({Key? key,
    required this.builder,
  }) : super(key: key) ;

  @override
  State<ResponsiveUIWidget> createState() => _ResponsiveUIWidgetState();
}

class _ResponsiveUIWidgetState extends State<ResponsiveUIWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          
          //* Set Device Info
          DeviceHelper.getInstance().setDeivceInfo(context, constraints, orientation);
          
          if (constraints.maxWidth == 0 || constraints.maxHeight == 0) {
            return const SizedBox.shrink();
          }
          return widget.builder(context, orientation, DeviceHelper.getInstance().screenType);
        });
      }),
    );
  }
}