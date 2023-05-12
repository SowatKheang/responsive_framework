
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
        String screenTypeText = '';
        switch (DeviceHelper.getInstance().screenType) {
          case EScreenType.MOBILE:
            screenTypeText = "This is Mobile Screen";
            break;
          case EScreenType.TABLET:
            screenTypeText = "This is Tablet Screen";
            break;
          default: screenTypeText = 'Other Screen'; break;
          
        }

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
                children: <Widget>[
                  
                  // Default Title Text Widget provide by responsive framework package
                  ResponsiveUIHelper.buildTitleTextWidget(title: '${DeviceHelper.getInstance().orientation}'),
                  
                  // Call px by num.px
                  SizedBox(height: 10.px),
                  
                  // Default Text Widget provide by responsive framework package
                  ResponsiveUIHelper.buildNormalTextWidget(text: screenTypeText),
                  
                  // Call px by LayoutSizeHelper.px(num)
                  SizedBox(height: LayoutSizeHelper.px(10)),

                  // Platform Widget provide by responsive framework package
                  ResponsiveUIHelper.buildPlatformWidget(
                    tabletWidget: Text('My Tablet Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
                    mobileWidget: Text('My Mobile Widget', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_SMALL)), 
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
