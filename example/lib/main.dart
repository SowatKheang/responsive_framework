
import 'package:flutter/material.dart';
import 'package:flutter_responsive_framework/flutter_responsive_framework.dart';
import 'my_platform_widget.dart';

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
          navigatorObservers: const <NavigatorObserver>[],
          routes: <String, WidgetBuilder>{
            'my_platform_widget': (context) => const MyPlatformWidget(),
          },
          home: Builder(
            builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(_appTitle, style: TextStyle(fontSize: FontSizeHelper.H3)),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        height: 10.h, // It will take 10% of the screen's height
                        width: 20.h, // It will take 20% of the screen's width
                        color: Colors.blue,
                      ), 

                      // Call px by num.px
                      SizedBox(height: 10.px),
                      
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
                        largeScreenWidget: Text('My Large Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                        tabletWidget: Text('My Medium Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                        mobileWidget: Text('My Small Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                      ),
                      
                      SizedBox(height: LayoutSizeHelper.px(10)),
                
                      // Platform Widget with Orientation provide by responsive framework package
                      ResponsiveUIHelper.buildPlatformWidgetWithOrientation(
                        larageScreenPortraitWidget: Text('My Large Portrait Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                        larageScreenLandScapetWidget: Text('My Large LandScape Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                        tabletPortraitWidget: Text('My Medium Portrait Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                        tabletLandScapetWidget: Text('My Medium LandScape Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                        mobilPortraitWidget: Text('My Small Portrait Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                        mobilLandScapeWidget: Text('My Small LandScape Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                      ),

                      SizedBox(height: LayoutSizeHelper.px(10)),
                
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.px, vertical: 5.px),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text('Go to PlatformWidgetScreen Implementation', style: TextStyle(color: Colors.white, fontSize: 16.px),),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => 
                            /// MyPlatformWidget extends from abstract PlatformScreenWidget
                            const MyPlatformWidget()
                          ));
                          // Navigator.pushNamed(context, "my_platform_widget");
                        },
                      ),
                
                    ],
                  ),
                ),
              );
            }
          ),
        );
      }
    );
  }
}
