
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
          title: 'Responsive Framework Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: Text('Responsive Framework Demo', style: TextStyle(fontSize: FontSizeHelper.H3),),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  UIHelper.buildTitleTextWidget(title: '${DeviceHelper.getInstance().orientation}'),
                  const SizedBox(height: 10),
                  UIHelper.buildNormalTextWidget(text: screenTypeText),
                ],
              ),
            ),
          ),
        );
    });
  }
}
