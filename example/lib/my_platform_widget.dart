
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_responsive_framework/flutter_responsive_framework.dart';

///
/// [MyPlatformWidget]
///
class MyPlatformWidget extends PlatformScreenWidget {

  const MyPlatformWidget( {Key? key}) : super(key: key);

  @override
  State<MyPlatformWidget> createState() => _MyPlatformWidgetState();
}

class _MyPlatformWidgetState extends PlatformScreenWidgetState<MyPlatformWidget> with PlatformScreenWidgetMixin {

  @override
  void init() {
    super.init();
  }
  
  @override
  String appBarTitle(BuildContext context) => 'My Platform Widget Implementation';

  @override
  Widget? leadingWidget() {
    super.leadingWidget();
    return IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back));
  }

  @override
  Widget mobileLandscapeBody(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.green,
        child: ResponsiveUIHelper.buildNormalTextWidget(text: 'Mobile Landscape Content')
      ),
    );
  }

  @override
  Widget mobilePortraitBody(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.green,
        child: ResponsiveUIHelper.buildNormalTextWidget(text: 'Mobile Portrait Content')
      ),
    );
  }

  @override
  Widget tabletLandscapeBody(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.green,
        child: ResponsiveUIHelper.buildNormalTextWidget(text: 'Tablet Landscape Content')
      ),
    );
  }

  @override
  Widget tabletPortraitBody(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.green,
        child: ResponsiveUIHelper.buildNormalTextWidget(text: 'Tablet Portrait Content')
      ),
    );
  }

}