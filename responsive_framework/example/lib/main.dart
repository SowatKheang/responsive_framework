
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

///
/// [MyApp]
///
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final String _appTitle = 'Responsive Framework Demo';

  @override
  Widget build(BuildContext context) {
    return ResponsiveUIWidget(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: _appTitle,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: Text(_appTitle, style: TextStyle(fontSize: FontSizeHelper.H3)),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  // Default Title Text Widget provide by responsive framework package
                  ResponsiveUIHelper.buildTitleTextWidget(title: DeviceHelper.getInstance().screenOrientationString),
                  
                  // Call px by num.px
                  SizedBox(height: 10.px),
                  
                  // Default Text Widget provide by responsive framework package
                  ResponsiveUIHelper.buildNormalTextWidget(text: DeviceHelper.getInstance().screenTypeString),
                  
                  // Call px by LayoutSizeHelper.px(num)
                  SizedBox(height: LayoutSizeHelper.px(10)),

                  // Platform Widget provide by responsive framework package
                  ResponsiveUIHelper.buildPlatformWidget(
                    tabletWidget: Text('My Tablet Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                    mobileWidget: Text('My Mobile Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                  ),
                  
                  SizedBox(height: LayoutSizeHelper.px(10)),

                  // Platform Widget with Orientation provide by responsive framework package
                  ResponsiveUIHelper.buildPlatformWidgetWithOrientation(
                    tabletPortraitWidget: Text('My Tablet Portrait Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                    tabletLandScapetWidget: Text('My Tablet LandScape Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                    mobilPortraitWidget: Text('My Mobile Portrait Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                    mobilLandScapeWidget: Text('My Mobile LandScape Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                  ),

                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
