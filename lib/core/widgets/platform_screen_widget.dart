
import 'package:flutter/material.dart';
import 'package:flutter_responsive_framework/flutter_responsive_framework.dart';

///
/// Example on how to implement [PlatformScreenWidget]
/// 
// class MyWidget extends PlatformScreenWidget {
//   const MyWidget( {Key? key}) : super(key: key);

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends PlatformScreenWidgetState<MyWidget> with PlatformScreenWidgetMixin {

//   @override
//   String appBarTitle(BuildContext context) {
//     throw UnimplementedError();
//   }

//   @override
//   Widget mobileLandscapeBody(BuildContext context) {
//     throw UnimplementedError();
//   }

//   @override
//   Widget mobilePortraitBody(BuildContext context) {
//     throw UnimplementedError();
//   }

//   @override
//   Widget tabletLandscapeBody(BuildContext context) {
//     throw UnimplementedError();
//   }

//   @override
//   Widget tabletPortraitBody(BuildContext context) {
//     throw UnimplementedError();
//   }

// }

///
/// [PlatformScreenWidget]
///
abstract class PlatformScreenWidget extends StatefulWidget {

  const PlatformScreenWidget({ Key? key }) : super(key: key);

}

///
/// [PlatformScreenWidgetState]
///
abstract class PlatformScreenWidgetState<E extends PlatformScreenWidget> extends State<E> with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {

  bool hasAppBar = true;

  BuildContext? showCaseContext;

  Color? scaffoldColor;

  bool resizeToAvoidBottomInset = false;


  @override
  bool get wantKeepAlive => true;

  /// Override this method to do something in initState
  @protected
  @mustCallSuper
  void init() {}

   /// Override this method to do something in initState
  @protected
  @mustCallSuper
  void onDispose() {}

  @override
  void initState() {
    init();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    onDispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// A method that is used to set the title of the app bar.
  String appBarTitle(BuildContext context);
  
}

///
/// [PlatformScreenWidgetMixin]
///
mixin PlatformScreenWidgetMixin<E extends PlatformScreenWidget> on PlatformScreenWidgetState<E>  {
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Builder(
      builder: (context) {
        return Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          backgroundColor: scaffoldColor ?? const Color(0xffF6F6FA),
          appBar: hasAppBar 
          ? AppBar(
            // title: Text(appBarTitle(context)),
            title: ResponsiveUIHelper.buildTitleTextWidget(title: appBarTitle(context)),
            leading: leadingWidget(),
            automaticallyImplyLeading: false,
            actions: actionWidgets(context),
          ) 
          : const PreferredSize(preferredSize: Size(0, 0), child: SizedBox.shrink()),
          body: _buildBody(context),
          floatingActionButton: floatingActionButtonWidget(),
          bottomNavigationBar: bottomNavigationBarWidget(),
        );
      }
    );
  }

  /// Default Leading is SizedBox.shrink()
  /// Override this method to set your own FloatingActionButton
  @protected
  Widget? leadingWidget() => null;


  /// Default AppBar action is SizedBox.shrink()
  /// Overrrde this method to set your own ActionWidget on the AppBar
  @protected
  List<Widget> actionWidgets(BuildContext context) => <Widget>[ const SizedBox.shrink() ];

  /// Default FloatingActionButton is SizedBox.shrink()
  /// Override this method to set your own FloatingActionButton
  @protected
  Widget floatingActionButtonWidget() => const SizedBox.shrink();

  /// Default Leading is SizedBox.shrink()
  /// Override this method to set your own BottomNavigationBar
  @protected
  Widget bottomNavigationBarWidget() => const SizedBox.shrink();

  ///
  Widget _buildBody(BuildContext context) {
    return ResponsiveUIWidget(builder: (context, orientation, screenType) {
      return ResponsiveUIHelper.buildPlatformWidgetWithOrientation(
        tabletPortraitWidget: tabletPortraitBody(context), 
        tabletLandScapetWidget: tabletLandscapeBody(context), 
        mobilPortraitWidget: mobilePortraitBody(context), 
        mobilLandScapeWidget: mobileLandscapeBody(context), 
      );
    });
  }

  Widget tabletLandscapeBody(BuildContext context);
  Widget tabletPortraitBody(BuildContext context);
  Widget mobileLandscapeBody(BuildContext context);
  Widget mobilePortraitBody(BuildContext context);
}